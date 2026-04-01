# Always prompt before deletion - safety measure to prevent accidental rm
function rm
  command rm -i $argv
end
