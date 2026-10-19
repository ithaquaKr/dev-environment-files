return {
  "coder/claudecode.nvim",
  opts = {
    -- Claude wraps OSC 52 (clipboard) in tmux DCS passthrough when $TMUX is set; nvim's
    -- :terminal can't parse that and prints "52;c;<base64>" into the buffer on mouse select.
    terminal_cmd = "env -u TMUX claude",
  },
}
