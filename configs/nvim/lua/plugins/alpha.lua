return {
  "goolord/alpha-nvim",
  opts = function(_, dashboard)
    local logo = [[
            
          _____                _____                    _____                    _____                    _____                    _____                    _____          
         /\    \              /\    \                  /\    \                  /\    \                  /\    \                  /\    \                  /\    \         
        /::\    \            /::\    \                /::\____\                /::\    \                /::\    \                /::\    \                /::\____\        
        \:::\    \           \:::\    \              /:::/    /               /::::\    \              /::::\    \              /::::\    \              /:::/    /        
         \:::\    \           \:::\    \            /:::/    /               /::::::\    \            /::::::\    \            /::::::\    \            /:::/    /         
          \:::\    \           \:::\    \          /:::/    /               /:::/\:::\    \          /:::/\:::\    \          /:::/\:::\    \          /:::/    /          
           \:::\    \           \:::\    \        /:::/____/               /:::/__\:::\    \        /:::/  \:::\    \        /:::/__\:::\    \        /:::/____/           
           /::::\    \          /::::\    \      /::::\    \              /::::\   \:::\    \      /:::/    \:::\    \      /::::\   \:::\    \       |::|    |            
  ____    /::::::\    \        /::::::\    \    /::::::\    \   _____    /::::::\   \:::\    \    /:::/    / \:::\    \    /::::::\   \:::\    \      |::|    |     _____  
 /\   \  /:::/\:::\    \      /:::/\:::\    \  /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \  /:::/    /   \:::\ ___\  /:::/\:::\   \:::\    \     |::|    |    /\    \ 
/::\   \/:::/  \:::\____\    /:::/  \:::\____\/:::/  \:::\    /::\____\/:::/  \:::\   \:::\____\/:::/____/     \:::|    |/:::/__\:::\   \:::\____\    |::|    |   /::\____\
\:::\  /:::/    \::/    /   /:::/    \::/    /\::/    \:::\  /:::/    /\::/    \:::\  /:::/    /\:::\    \     /:::|____|\:::\   \:::\   \::/    /    |::|    |  /:::/    /
 \:::\/:::/    / \/____/   /:::/    / \/____/  \/____/ \:::\/:::/    /  \/____/ \:::\/:::/    /  \:::\    \   /:::/    /  \:::\   \:::\   \/____/     |::|    | /:::/    / 
  \::::::/    /           /:::/    /                    \::::::/    /            \::::::/    /    \:::\    \ /:::/    /    \:::\   \:::\    \         |::|____|/:::/    /  
   \::::/____/           /:::/    /                      \::::/    /              \::::/    /      \:::\    /:::/    /      \:::\   \:::\____\        |:::::::::::/    /   
    \:::\    \           \::/    /                       /:::/    /               /:::/    /        \:::\  /:::/    /        \:::\   \::/    /        \::::::::::/____/    
     \:::\    \           \/____/                       /:::/    /               /:::/    /          \:::\/:::/    /          \:::\   \/____/          ~~~~~~~~~~          
      \:::\    \                                       /:::/    /               /:::/    /            \::::::/    /            \:::\    \                                  
       \:::\____\                                     /:::/    /               /:::/    /              \::::/    /              \:::\____\                                 
        \::/    /                                     \::/    /                \::/    /                \::/____/                \::/    /                                 
         \/____/                                       \/____/                  \/____/                  ~~                       \/____/                                  
                                                                                                                                                                           
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    local button = dashboard.button("p", " " .. " Recent Projects", ":Telescope projects <CR>")
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
    dashboard.section.buttons.val[4] = button
  end,
}