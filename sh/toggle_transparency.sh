fswatch -0 ~/.local/state/term/transparency.txt | while read -d '' event
do
  value=$(cat ~/.local/state/term/transparency.txt | tr -d '\n')
  echo "transparency: $value"
  if [ "$value" = "true" ] || [ "$value" = "false" ]; then
    nvim --server /tmp/nvim.pipe --remote-send "<Cmd>lua ExecuteOnTransparencyFileChange('$value')<CR>"
  else
    echo "Invalid value: '$value' (must be true or false)"
  fi
done
