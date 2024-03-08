local M = {}

function M.tableToFile(filename, tbl)
    local lines = { "return {" }

    for k, v in pairs(tbl) do
        table.insert(lines, string.format('    "%s",', tostring(v)))
    end

    table.insert(lines, "}")

    vim.fn.writefile(lines, filename)
end

function M.tableFromFile(filename)
    local chunk = loadfile(filename)
    if chunk then
        local table = chunk()
        return table
    else
        return nil
    end
end

function M.concatenateTables(t1, t2)
    local result = {}
    for _, v in ipairs(t1) do
        table.insert(result, v)
    end
    for _, v in ipairs(t2) do
        table.insert(result, v)
    end
    return result
end

function M.removeDuplicates(tbl)
    local result = {}
    for _, v in ipairs(tbl) do
        if not M.isDuplicate(v, result) then
            table.insert(result, v)
        end
    end
    return result
end

function M.isDuplicate(projectname, projects)
    for _, name in ipairs(projects) do
        if name == projectname then
            return true
        end
    end
    return false
end

function M.log(msg, hl)
    vim.api.nvim_echo({ { "ProjectManager: " .. msg, hl } }, true, {})
end

return M
