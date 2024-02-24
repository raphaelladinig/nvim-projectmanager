local M = {}

function M.tableToFile(filename, tbl)
    local lines = {"return {"}

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

function M.isDuplicate(projectname, projects)
    -- Check if projectname already exists in projects
    for _, name in ipairs(projects) do
        if name == projectname then
            return true
        end
    end
    return false
end

return M
