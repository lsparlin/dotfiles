local function requireAndReset(name)
  package.loaded[name] = nil
  return require(name)
end

requireAndReset('plugins').run()

requireAndReset('settings').run()
requireAndReset('mappings').run()
