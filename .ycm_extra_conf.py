import os
import os.path
import ycm_core

BASE_FLAGS = [
        '-Wall',
        '-Wno-long-long',
        '-I/usr/lib/',
        '-I/usr/include/'
        ]

HEADER_EXTENSIONS = [
        '.h'
        ]
        
SOURCE_EXTENSIONS = [
        '.c'
        ]

def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSIONS

def GetCompilationInfoForFile(database, filename):
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]
        for extension in SOURCE_EXTENSIONS:
            # Get info from the source files by replacing the extension.
            replacement_file = basename + extension
            if os.path.exists(replacement_file):
                compilation_info = database.GetCompilationInfoForFile(replacement_file)
                if compilation_info.compiler_flags_:
                    return compilation_info
        return None
    return database.GetCompilationInfoForFile(filename)

def FindNearest(path, target):
    candidate = os.path.join(path, target)
    if(os.path.isfile(candidate)):
        return candidate;

    rootmark = os.path.join(path, '.git')
    if(os.path.isdir(rootmark)):
        return None

    parent = os.path.dirname(os.path.abspath(path));
    if(parent == path):
        return None

    return FindNearest(parent, target)

def FlagsForCompilationDatabase(root, filename):
        compilation_db_path = FindNearest(root, 'compile_commands.json')
        compilation_db =  ycm_core.CompilationDatabase(compilation_db_dir)
        if not compilation_db:
            return None
        compilation_info = GetCompilationInfoForFile(compilation_db, filename)
        if not compilation_info:
            return None
        return compilation_info.compiler_flags_

def FlagsForFile(filename):
    root = os.path.realpath(filename);
    compilation_db_flags = FlagsForCompilationDatabase(root, filename)
    if compilation_db_flags:
        final_flags = compilation_db_flags
    else:
        final_flags = BASE_FLAGS
    return {
           'flags': final_flags,
           'do_cache': True
           }