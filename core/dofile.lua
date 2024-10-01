function dofile(file_name)
    local file_temp = storage:file(file_name, READ)
    file_temp:open()
    file_temp_text_ = file_temp:readAll()
    --- exec the file
    local func= load(file_temp_text_, file_name)
    --- close the file
    file_temp:close()
    func()
end