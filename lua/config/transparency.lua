-- TransparencyFilename = vim.fn.expand '~' .. '/.local/state/term/transparency.txt'
TransparencyFilename = vim.fn.expand '~/.local/state/term/transparency.txt'

function SetIsTransparent(value)
  value = tostring(value)

  if value == 'true' then
    vim.g.is_transparent = true
  elseif value == 'false' then
    vim.g.is_transparent = false
  else
    vim.notify("Invalid Transparency value: '" .. value .. "'", vim.log.levels.WARN)
  end
end

function ReadTransparencyFile()
  local file = io.open(TransparencyFilename, 'r')

  if file then
    local content = file:read '*a'
    content = content:gsub('\n', '') -- Remove any trailing newline characters

    SetIsTransparent(content) -- Set transparency based on file content
    file:close()
  else
    SetIsTransparent 'true' -- Default to 'true' if the file doesn't exist
    WriteTransparencyFile() -- Write default transparency value
  end
end

function WriteTransparencyFile()
  local file = io.open(TransparencyFilename, 'w')

  if file then
    -- Run the shell command using vim.fn.system for better control
    local transparency_value = vim.g.is_transparent and 0.7 or 1
    local toggle_cmd = vim.fn.expand '~/.config/wezterm/toggle_transparency.sh' .. ' ' .. transparency_value

    vim.fn.system('sh ' .. toggle_cmd)

    -- Write the current transparency value to the file
    file:write(tostring(vim.g.is_transparent))
    file:close()
  else
    -- Handle error if the file can't be opened
    vim.notify('Error: Unable to write to file ' .. TransparencyFilename, vim.log.levels.ERROR)
  end
end
