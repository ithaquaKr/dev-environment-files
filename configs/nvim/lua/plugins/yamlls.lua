-- Teach yamlls Ansible's `!vault` tag, so vault-encrypted values in plain
-- YAML files (e.g. Ansible inventories outside playbooks/roles, which keep the
-- `yaml` filetype) are not flagged as "Unresolved tag: !vault".
-- Merged into the settings of the lang.yaml extra.
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            customTags = { "!vault scalar" },
          },
        },
      },
    },
  },
}
