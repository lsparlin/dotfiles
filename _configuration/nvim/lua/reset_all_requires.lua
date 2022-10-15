local M = {}

function M.run()
  for k in pairs(package.loaded) do
    package.loaded[k] = nil
  end
end

return M
