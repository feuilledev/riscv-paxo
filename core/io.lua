-- Port of IO module for basic use
local io = {}

io.outputBuffer = ""

function io.write(...)
    for _, v in ipairs({...}) do
        if type(v) == "string" then
            io.outputBuffer = io.outputBuffer .. v
        elseif type(v) == "number" then
            io.outputBuffer = io.outputBuffer .. tostring(v)
        end
    end
end
function io.read(file_path)
    print("read")
    tmp_file_opener = storage:file(file_path, READ)
    tmp_file_opener:open()
    file_temp_text_ = tmp_file_opener:readAll()
    tmp_file_opener:close()
    -- return
    return file_temp_text_
end
function io.flush()
    print(io.outputBuffer)
    io.outputBuffer = ""  
end

function io.readLine(input)
    if input then
        return input
    else
        return ""
    end
end

function io.writef(fmt, ...)
    io.write(string.format(fmt, ...))
end

function io.readAll(input)
    return input or ""
end

function io.dumpMemory(memory)
    local buf = ""
    for i = 0, #memory do
        buf = buf .. string.char(memory[i] or 0)
    end

    for i = 1, math.ceil(#buf / 16) * 16 do
        if (i - 1) % 16 == 0 then io.write(string.format('%08X  ', i - 1)) end
        io.write(i > #buf and '   ' or string.format('%02X ', buf:byte(i)))
        if i % 8 == 0 then io.write(' ') end
        if i % 16 == 0 then
            local line = buf:sub(i - 16 + 1, i):gsub('%c', '.')
            io.write(line .. '\n')
        end
    end
end

return io