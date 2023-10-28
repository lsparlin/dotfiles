local function requireAndReset(name)
  package.loaded[name] = nil
  return require(name)
end

vim.g.mapleader = ','
requireAndReset('plugins').run()

requireAndReset('settings').run()
requireAndReset('mappings').run()
