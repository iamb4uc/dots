local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local handle = assert(io.popen('fortune -s'))
local fortune = handle:read("*all")

dashboard.section.header.val = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[　　　 　　/＾>》, -―‐‐＜＾}]],
    [[　　　 　./:::/,≠´::::::ヽ.]],
    [[　　　　/::::〃::::／}::丿ハ]],
    [[　　　./:::::i{l|／　ﾉ／ }::}]],
    [[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
    [[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
    [[　 |:::::::|／}｀ｽ /          /]],
    [[.　|::::::|(_:::つ/ ThinkPad /　neovim!]],
    [[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
  }

dashboard.section.buttons.val = {
  -- dashboard.button( "SPC fo", "Last session" , ":Telescope oldfiles<CR>"),
  -- dashboard.button( "SPC ff", "Find file" , ":Telescope find_files<CR>"),
  -- dashboard.button( "SPC N",  "New file" , ":tabnew<CR>"),
  -- dashboard.button( "SPC fP", "Edit Config" , ":e ~/.config/nvim/<CR>"),
}

handle:close()
dashboard.section.footer.val = fortune
-- dashboard.section.header.opts.hl = "Title"
-- dashboard.section.buttons.opts.hl = "Debug"
-- dashboard.section.footer.opts.hl = "Conceal"
dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
