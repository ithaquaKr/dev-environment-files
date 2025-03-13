return {
  -- "ithaquaKr/obsidian.nvim",
  dir = "/Users/ithaqua/work/fork/obsidian.nvim",
  name = "obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "knowhow",
        path = "/Users/ithaqua/Library/Mobile Documents/com~apple~CloudDocs/knowhow",
      },
    },
    notes_subdir = "Inbox",
    new_notes_location = "notes_subdir",
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    wiki_link_func = "use_alias_only",
    -- disable_frontmatter = true,
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title and note.title ~= "Action items" then
        note:add_alias(note.title)
      end

      local out = { id = note.id, aliases = note.aliases }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      -- if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      --   for k, v in pairs(note.metadata) do
      --     out[k] = v
      --   end
      -- end
      return out
    end,
    -- see below for full list of options 👇
    daily_notes = {
      folder = "./Journal/daily/",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = "3. RESOURCE/template/Daily Journal.md",
    },
    templates = {
      folder = "3. RESOURCE/template/",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M:%S",
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      -- name = "telescope.nvim",
      name = "fzf-lua",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
  },
}
