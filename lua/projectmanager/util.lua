local M = {}

function M.tableToFile(filename, table)
    local lines = {"return {"}

    for k, v in pairs(table) do
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

return M
