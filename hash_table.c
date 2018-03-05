//! gcc -O3 intern_hash.c -std=c11 -Wall -Wextra -o intern_hash

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned int uint;

////////////////////////////////////////////////////////////////////////

void* my_realloc(void* old, size_t size)
{
    void* ptr = realloc(old, size);
    if (!ptr)
    {
        perror("Out of memory!");
        exit(1);
    }
    return ptr;
}

uint* uint_realloc(uint* old, size_t size)
{
    return (uint*)my_realloc(old, size * sizeof(int));
}

void*   my_alloc(size_t size) { return   my_realloc(0, size); }
uint* uint_alloc(size_t size) { return uint_realloc(0, size); }

////////////////////////////////////////////////////////////////////////

typedef struct Vector
{
    uint*  buffer;
    size_t size;
    size_t capacity;
} Vector;

void resize_vector(Vector* vec, size_t new_size, uint value)
{
    // adjust capacity
    if (new_size > vec->capacity)
    {
        size_t new_capacity = new_size * 2;
        vec->capacity       = new_capacity;
        vec->buffer         = uint_realloc(vec->buffer, new_capacity);
    }
    // initialize new elements (if any)
    for (size_t i = vec->size; i < new_size; i++)
        vec->buffer[i] = value;
    // update size
    vec->size = new_size;
}

Vector new_vector(size_t size, uint value)
{
    Vector vec = {
        .buffer   = uint_alloc(256),
        .size     = 0,
        .capacity = 256,
    };
    resize_vector(&vec, size, value);
    return vec;
}

////////////////////////////////////////////////////////////////////////

typedef struct Pool
{
    char*  buffer;
    size_t size;
    size_t capacity;
} Pool;

size_t append(Pool* pool, const char* s)
{
    size_t old_size = pool->size;
    size_t new_size = old_size + strlen(s) + 1;
    pool->size = new_size;

    if (new_size > pool->capacity)
    {
        size_t new_capacity = new_size * 2;
        pool->capacity      = new_capacity;
        pool->buffer        = my_realloc(pool->buffer, new_capacity);
    }
    strcpy(pool->buffer + old_size, s);
    return old_size; // location of s
}

Pool new_pool()
{
    Pool pool = {
        .buffer   = my_alloc(256),
        .size     = 0,
        .capacity = 256,
    };
    return pool;
}

////////////////////////////////////////////////////////////////////////

typedef struct Hash_table
{
    Pool   pool;
    Vector pointers;    // reffers to the strings in pool.
    uint   nb_elements; // used to compute the occupation rate.
} Hash_table;

Hash_table new_intern_pool()
{
    Hash_table table = {
        .pool        = new_pool(),
        .pointers    = new_vector(1024, -1),
        .nb_elements = 0,
    };
    return table;
}

void del_intern_pool(Hash_table table)
{
    free(table.pool.buffer);
    free(table.pointers.buffer);
}

// FVN-1a hash -- http://isthe.com/chongo/tech/comp/fnv/
uint fvn_hash(const char* s)
{
    uint hash = 2166136261; // offset basis (32 bits)
    for (const char* ptr = s; *ptr != '\0'; ptr++)
    {
        hash ^= *ptr;       // xor
        hash *= 16777619;   // prime (32 bits)
    }
    return hash;
}

void expand_table(Hash_table* table)
{
    uint   size         = table->pointers.size;
    uint*  pointers     = table->pointers.buffer;
    char*  pool         = table->pool    .buffer;
    uint   new_size     = size * 2;
    Vector new_p        = new_vector(new_size, -1);
    uint*  new_pointers = new_p.buffer;

    for (uint i = 0; i < size; i++)
        if (pointers[i] != -1u)
        {
            uint j = fvn_hash(pool + pointers[i]) % new_size;
            while (new_pointers[j] != -1u)
                j = (j + 1) % new_size;
            new_pointers[j] = pointers[i];
        }

    free(pointers);
    table->pointers = new_p;
}

uint add(Hash_table* table, const char* s)
{
    uint   size     = table->pointers.size;
    uint*  pointers = table->pointers.buffer;
    char*  pool     = table->pool    .buffer;

    // open addressing, linear probing
    uint index = fvn_hash(s) % size;
    while(pointers[index] != -1u)
    {
        if (strcmp(s, pool + pointers[index]) == 0)
            return pointers[index]; // already stored!
        index = (index + 1) % size;
    }

    // The string didn't exist, we add it
    uint handle     = append(&table->pool, s);
    pointers[index] = handle;
    table->nb_elements++;

    // adjust the size of the table
    if (table->nb_elements > (size / 3) * 2) // 66% occupation
        expand_table(table);

    return handle;
}

typedef Hash_table Intern_pool;

////////////////////////////////////////////////////////////////////////

// Intern pool API:
//
// Intern_pool new_intern_pool();
// void        del_intern_pool();
// uint        add(Intern_pool*, const char*);

int main(int argc, char* argv[])
{
    for (int i = 1; i < argc; i++)
    {
        FILE* file = fopen(argv[i], "r");
        if (file == 0)
        {
            perror("main");
            continue;
        }

        Intern_pool intern_pool = new_intern_pool();
        char buffer[256];
        while (fgets(buffer, 256, file)) // one identifier per line
        {
            buffer[strlen(buffer)-1] = '\0'; // removes the `\n` from fgets()
            add(&intern_pool, buffer);
        }

        del_intern_pool(intern_pool);
        if (fclose(file) != 0)
            perror("main");
    }
    return 0;
}