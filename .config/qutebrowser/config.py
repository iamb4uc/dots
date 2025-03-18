# config.py for qutebrowser

# General settings
config.load_autoconfig(False)  # Disable automatic loading of settings
config.set('content.autoplay', False)  # Disable autoplay
config.set('content.javascript.enabled', True)  # Enable JavaScript globally
config.set('content.notifications.enabled', False)  # Disable notifications

# Minimal UI
c.statusbar.show = 'in-mode'  # Show status bar only in command mode
c.tabs.show = 'multiple'  # Show tabs only when multiple are open
c.tabs.padding = {"top": 2, "bottom": 2, "left": 5, "right": 5}  # Minimal tab padding
c.tabs.indicator.width = 0  # Hide loading indicator
c.tabs.indicator.padding = {"top": 0, "bottom": 0, "left": 0, "right": 0}
c.tabs.title.alignment = 'center'  # Center-align tab titles
c.completion.height = '15%'  # Minimal completion window height

# Disable unnecessary UI elements
c.hints.border = '1px solid #ebdbb2'
c.prompt.radius = 0  # Minimal radius for prompts
c.scrolling.smooth = True  # Enable smooth scrolling

# Fonts and sizes
c.fonts.default_family = ["JetBrainsMono Nerd Font", "monospace"]
c.fonts.default_size = "10pt"

# Gruvbox color theme
gruvbox_dark = {
    'bg': '#282828',
    'bg_alt': '#3c3836',
    'fg': '#ebdbb2',
    'fg_alt': '#928374',
    'red': '#cc241d',
    'green': '#98971a',
    'yellow': '#d79921',
    'blue': '#458588',
    'purple': '#b16286',
    'aqua': '#689d6a',
    'orange': '#d65d0e',
    'gray': '#a89984',
}

# Apply colors to the UI
c.colors.completion.fg = gruvbox_dark['fg']
c.colors.completion.odd.bg = gruvbox_dark['bg']
c.colors.completion.even.bg = gruvbox_dark['bg_alt']
c.colors.completion.category.fg = gruvbox_dark['yellow']
c.colors.completion.category.bg = gruvbox_dark['bg']
c.colors.completion.category.border.top = gruvbox_dark['bg']
c.colors.completion.category.border.bottom = gruvbox_dark['bg']
c.colors.completion.item.selected.fg = gruvbox_dark['bg']
c.colors.completion.item.selected.bg = gruvbox_dark['yellow']
c.colors.completion.item.selected.border.top = gruvbox_dark['yellow']
c.colors.completion.item.selected.border.bottom = gruvbox_dark['yellow']
c.colors.completion.match.fg = gruvbox_dark['blue']

c.colors.statusbar.normal.fg = gruvbox_dark['fg']
c.colors.statusbar.normal.bg = gruvbox_dark['bg']
c.colors.statusbar.insert.fg = gruvbox_dark['bg']
c.colors.statusbar.insert.bg = gruvbox_dark['green']
c.colors.statusbar.command.fg = gruvbox_dark['fg']
c.colors.statusbar.command.bg = gruvbox_dark['bg_alt']
c.colors.statusbar.url.fg = gruvbox_dark['fg']
c.colors.statusbar.url.hover.fg = gruvbox_dark['blue']
c.colors.statusbar.url.success.http.fg = gruvbox_dark['green']
c.colors.statusbar.url.success.https.fg = gruvbox_dark['green']
c.colors.statusbar.url.error.fg = gruvbox_dark['red']

c.colors.tabs.bar.bg = gruvbox_dark['bg']
c.colors.tabs.odd.bg = gruvbox_dark['bg']
c.colors.tabs.odd.fg = gruvbox_dark['fg']
c.colors.tabs.even.bg = gruvbox_dark['bg_alt']
c.colors.tabs.even.fg = gruvbox_dark['fg']
c.colors.tabs.selected.odd.bg = gruvbox_dark['yellow']
c.colors.tabs.selected.odd.fg = gruvbox_dark['bg']
c.colors.tabs.selected.even.bg = gruvbox_dark['yellow']
c.colors.tabs.selected.even.fg = gruvbox_dark['bg']

c.colors.hints.fg = gruvbox_dark['bg']
c.colors.hints.bg = gruvbox_dark['yellow']
c.colors.hints.match.fg = gruvbox_dark['fg']

c.colors.messages.error.fg = gruvbox_dark['bg']
c.colors.messages.error.bg = gruvbox_dark['red']
c.colors.messages.warning.fg = gruvbox_dark['bg']
c.colors.messages.warning.bg = gruvbox_dark['orange']
c.colors.messages.info.fg = gruvbox_dark['fg']
c.colors.messages.info.bg = gruvbox_dark['bg']

# Set dark mode
c.colors.webpage.bg = gruvbox_dark['bg']
c.colors.webpage.darkmode.enabled = False

c.statusbar.show = 'never'
c.tabs.show = 'never'

c.url.searchengines = {
    '!s':      'https://searx.be/search?q={}',
    'DEFAULT': 'https://duckduckgo.com/?ia=web&q={}',
}

c.url.default_page =  "~/.local/share/home/index.html"
c.url.start_pages = "~/.local/share/home/index.html"

# Keybindings for minimalism
config.bind('xt', 'config-cycle tabs.show always switching')  # Toggle tabs
config.bind('xs', 'config-cycle statusbar.show always in-mode')  # Toggle status bar
