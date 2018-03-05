--[[

This program resulted from a request for a demonstration described as
follows:

"We want to load in a series of [images] and output them at intervals
of one second, updating the play list if more images get added to the
directory from which images are loaded ..."

The solution shown uses several coroutines all active at the same time;
the first co-routine checks to see if any new image files have appeared,
and if they have it loads them into memory and updates the play list.
The second co-routine remembers how far through the cycle it is and
outputs the next image.  Both routines need to remember the previous
state they were left in, so simple function calls are going to be
inadequate unless you rely on global variables.

]]

-- Sleeping in Lua - no built in method, and delay loops that
-- keep checking the clock are going to burn c.p.u. cycles, so ...

sleep_awhile = function (period)
        os.execute("sleep "..period)
        end

load_images = function()
        -- see if any new files have appeared
        -- if they HAVE, read them into cache buffer
        while true do
                nnew = 0
                phandle = io.popen("ls -1","r")
                imnames = {}
                        while true do
                        lyne = phandle:read()
                        if lyne == nil then break end
                        imnames[#imnames+1] = lyne
                        if image_list[lyne] == nil then
                                fh = io.open(lyne,"r")
                                image_list[lyne] = fh:read("*all")
                                nnew = nnew + 1
                                end
                        end
                -- temporary return - pass back count of extras loaded
                coroutine.yield(nnew)
                print ("AGAIN ...")
        end
end

show_images = function()
        -- Pass back NEXT image in sequence
        count = 0
        while true do
                count = count + 1
                current = 1 + math.floor(count % #imnames)
                print (current, imnames[current])
                coroutine.yield()
        end
end

-- ======= Main code =============

image_list = {}
zonked = 0
tap = coroutine.create(load_images)
plughole = coroutine.create(show_images)

while zonked == 0 do
        itdidit,newcount = coroutine.resume(tap)
        sleep_awhile(1)
        print (newcount)
        itdidit = coroutine.resume(plughole)
end

--[[ ========== Sample Output ================

[trainee@easterton nats]$ lua ff2.lua
27
2       anim_o1.lua
AGAIN ...
0
3       bpm
AGAIN ...
0
4       clever
AGAIN ...

]]
