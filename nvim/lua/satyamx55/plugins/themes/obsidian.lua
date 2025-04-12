-- Obsidian Theme for Neovim
-- A dark, elegant theme with deep blacks and vibrant accent colors

return {
  "obsidian-nvim/obsidian.nvim",
  name = "obsidian",
  priority = 1000,
  config = function()
    local transparent = false -- Set to true if you want transparency

    -- Color definitions
    local colors = {
      bg = {
        deep = "#121212", -- Main background
        darker = "#0a0a0a", -- Darker elements
        lighter = "#1e1e1e", -- Lighter elements
        float = "#181818", -- Float windows
        selection = "#2d2d2d", -- Visual selection
      },
      fg = {
        primary = "#d8d8d8", -- Primary text
        secondary = "#a0a0a0", -- Secondary text
        muted = "#707070", -- Muted text elements
        bright = "#f0f0f0", -- Bright text for emphasis
      },
      syntax = {
        comment = "#636363",
        string = "#b8cd9e",
        number = "#d19a66",
        keyword = "#c792ea",
        function_name = "#82aaff",
        constant = "#ff9e64",
        type = "#7fdbca",
        variable = "#e4e4e4",
        parameter = "#e4e4e4",
        operator = "#89ddff",
        statement = "#c586c0",
        preproc = "#d4bfff",
      },
      ui = {
        accent = "#9370db", -- Main accent color (purple)
        accent_alt = "#d787d7", -- Secondary accent (lighter purple)
        cursor = "#aeafad", -- Cursor color
        line_highlight = "#252525", -- Current line highlight
        search = "#4f4f4f", -- Search highlight
        search_text = "#d8d8d8", -- Text in search highlight
        pmenu_bg = "#252525", -- Popup menu background
        pmenu_sel = "#354465", -- Selected item in popup menu
        pmenu_text = "#d8d8d8", -- Popup menu text
        error = "#ff5555", -- Error color
        warning = "#f2c68a", -- Warning color
        info = "#80cbc4", -- Info color
        hint = "#80a0ff", -- Hint color
        success = "#50fa7b", -- Success color
        diff_add = "#2d3f34", -- Git diff addition
        diff_change = "#36425b", -- Git diff change
        diff_delete = "#4b2942", -- Git diff deletion
      },
      borders = "#3a3a3a", -- Window borders
      none = "NONE", -- Transparency
    }

    -- Create the color scheme
    local obsidian = {}

    function obsidian.setup()
      -- Clear existing highlighting
      vim.cmd("highlight clear")
      if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
      end
      vim.o.background = "dark"
      vim.o.termguicolors = true

      -- Set theme name
      vim.g.colors_name = "obsidian"

      -- Define highlight groups
      local highlight_groups = {
        -- Editor UI
        Normal = { fg = colors.fg.primary, bg = transparent and colors.none or colors.bg.deep },
        NormalFloat = { fg = colors.fg.primary, bg = transparent and colors.none or colors.bg.float },
        FloatBorder = { fg = colors.borders, bg = transparent and colors.none or colors.bg.float },
        LineNr = { fg = colors.fg.muted },
        CursorLineNr = { fg = colors.ui.accent, bold = true },
        CursorLine = { bg = colors.ui.line_highlight },
        CursorColumn = { bg = colors.ui.line_highlight },
        ColorColumn = { bg = colors.bg.lighter },
        Cursor = { fg = colors.bg.deep, bg = colors.ui.cursor },
        MatchParen = { fg = colors.ui.accent, bg = colors.ui.search, bold = true },
        Visual = { bg = colors.bg.selection },
        VisualNOS = { bg = colors.bg.selection },
        Search = { fg = colors.ui.search_text, bg = colors.ui.search },
        IncSearch = { fg = colors.bg.deep, bg = colors.ui.accent },
        SignColumn = { bg = transparent and colors.none or colors.bg.deep },
        VertSplit = { fg = colors.borders, bg = transparent and colors.none or colors.bg.deep },
        StatusLine = { fg = colors.fg.primary, bg = colors.bg.lighter },
        StatusLineNC = { fg = colors.fg.muted, bg = colors.bg.lighter },
        NonText = { fg = colors.fg.muted },
        SpecialKey = { fg = colors.fg.muted },
        Directory = { fg = colors.ui.accent },
        Title = { fg = colors.ui.accent, bold = true },
        ErrorMsg = { fg = colors.ui.error, bold = true },
        WarningMsg = { fg = colors.ui.warning, bold = true },
        MoreMsg = { fg = colors.ui.info },
        Question = { fg = colors.ui.info },
        Folded = { fg = colors.fg.secondary, bg = colors.bg.lighter },
        FoldColumn = { fg = colors.fg.muted, bg = transparent and colors.none or colors.bg.deep },
        Conceal = { fg = colors.fg.muted },
        Whitespace = { fg = colors.fg.muted },
        WildMenu = { fg = colors.ui.search_text, bg = colors.ui.search },
        Pmenu = { fg = colors.ui.pmenu_text, bg = colors.ui.pmenu_bg },
        PmenuSel = { fg = colors.fg.bright, bg = colors.ui.pmenu_sel },
        PmenuSbar = { bg = colors.ui.pmenu_bg },
        PmenuThumb = { bg = colors.ui.accent },
        TabLine = { fg = colors.fg.secondary, bg = colors.bg.lighter },
        TabLineFill = { bg = colors.bg.lighter },
        TabLineSel = { fg = colors.fg.primary, bg = colors.bg.lighter, bold = true },
        SpellBad = { sp = colors.ui.error, undercurl = true },
        SpellCap = { sp = colors.ui.warning, undercurl = true },
        SpellRare = { sp = colors.ui.hint, undercurl = true },
        SpellLocal = { sp = colors.ui.info, undercurl = true },

        -- Syntax highlighting
        Comment = { fg = colors.syntax.comment, italic = true },
        Constant = { fg = colors.syntax.constant },
        String = { fg = colors.syntax.string },
        Character = { fg = colors.syntax.string },
        Number = { fg = colors.syntax.number },
        Boolean = { fg = colors.syntax.constant },
        Float = { fg = colors.syntax.number },
        Identifier = { fg = colors.syntax.variable },
        Function = { fg = colors.syntax.function_name },
        Statement = { fg = colors.syntax.statement },
        Conditional = { fg = colors.syntax.keyword },
        Repeat = { fg = colors.syntax.keyword },
        Label = { fg = colors.syntax.keyword },
        Operator = { fg = colors.syntax.operator },
        Keyword = { fg = colors.syntax.keyword },
        Exception = { fg = colors.syntax.keyword },
        PreProc = { fg = colors.syntax.preproc },
        Include = { fg = colors.syntax.preproc },
        Define = { fg = colors.syntax.preproc },
        Macro = { fg = colors.syntax.preproc },
        PreCondit = { fg = colors.syntax.preproc },
        Type = { fg = colors.syntax.type },
        StorageClass = { fg = colors.syntax.keyword },
        Structure = { fg = colors.syntax.type },
        Typedef = { fg = colors.syntax.type },
        Special = { fg = colors.ui.accent_alt },
        SpecialChar = { fg = colors.ui.accent_alt },
        Tag = { fg = colors.syntax.keyword },
        Delimiter = { fg = colors.fg.primary },
        SpecialComment = { fg = colors.syntax.comment, italic = true },
        Debug = { fg = colors.ui.error },
        Underlined = { underline = true },
        Ignore = { fg = colors.fg.muted },
        Error = { fg = colors.ui.error },
        Todo = { fg = colors.ui.warning, bold = true },

        -- Diagnostic
        DiagnosticError = { fg = colors.ui.error },
        DiagnosticWarn = { fg = colors.ui.warning },
        DiagnosticInfo = { fg = colors.ui.info },
        DiagnosticHint = { fg = colors.ui.hint },
        DiagnosticUnderlineError = { sp = colors.ui.error, undercurl = true },
        DiagnosticUnderlineWarn = { sp = colors.ui.warning, undercurl = true },
        DiagnosticUnderlineInfo = { sp = colors.ui.info, undercurl = true },
        DiagnosticUnderlineHint = { sp = colors.ui.hint, undercurl = true },

        -- Diff
        DiffAdd = { bg = colors.ui.diff_add },
        DiffChange = { bg = colors.ui.diff_change },
        DiffDelete = { bg = colors.ui.diff_delete },
        DiffText = { bg = colors.ui.diff_change, underline = true },

        -- Git
        GitSignsAdd = { fg = colors.ui.success },
        GitSignsChange = { fg = colors.ui.info },
        GitSignsDelete = { fg = colors.ui.error },

        -- LSP
        LspReferenceText = { bg = colors.ui.line_highlight },
        LspReferenceRead = { bg = colors.ui.line_highlight },
        LspReferenceWrite = { bg = colors.ui.line_highlight },
        LspCodeLens = { fg = colors.fg.muted },

        -- Treesitter
        ["@comment"] = { link = "Comment" },
        ["@error"] = { link = "Error" },
        ["@none"] = {},
        ["@preproc"] = { link = "PreProc" },
        ["@define"] = { link = "Define" },
        ["@operator"] = { link = "Operator" },
        ["@punctuation.delimiter"] = { fg = colors.syntax.operator },
        ["@punctuation.bracket"] = { fg = colors.syntax.operator },
        ["@punctuation.special"] = { fg = colors.syntax.operator },
        ["@string"] = { link = "String" },
        ["@string.regex"] = { fg = colors.syntax.string },
        ["@string.escape"] = { fg = colors.ui.accent_alt },
        ["@string.special"] = { fg = colors.ui.accent_alt },
        ["@character"] = { link = "Character" },
        ["@character.special"] = { fg = colors.ui.accent_alt },
        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@float"] = { link = "Float" },
        ["@function"] = { link = "Function" },
        ["@function.call"] = { fg = colors.syntax.function_name },
        ["@function.builtin"] = { fg = colors.syntax.function_name, italic = true },
        ["@function.macro"] = { fg = colors.syntax.preproc },
        ["@method"] = { fg = colors.syntax.function_name },
        ["@method.call"] = { fg = colors.syntax.function_name },
        ["@constructor"] = { fg = colors.syntax.type },
        ["@parameter"] = { fg = colors.syntax.parameter },
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.function"] = { fg = colors.syntax.keyword },
        ["@keyword.operator"] = { fg = colors.syntax.operator },
        ["@keyword.return"] = { fg = colors.syntax.keyword },
        ["@conditional"] = { link = "Conditional" },
        ["@repeat"] = { link = "Repeat" },
        ["@debug"] = { link = "Debug" },
        ["@label"] = { link = "Label" },
        ["@include"] = { link = "Include" },
        ["@exception"] = { link = "Exception" },
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { fg = colors.syntax.type, italic = true },
        ["@type.qualifier"] = { fg = colors.syntax.keyword },
        ["@type.definition"] = { fg = colors.syntax.type },
        ["@storageclass"] = { link = "StorageClass" },
        ["@attribute"] = { fg = colors.syntax.preproc },
        ["@field"] = { fg = colors.syntax.variable },
        ["@property"] = { fg = colors.syntax.variable },
        ["@variable"] = { link = "Identifier" },
        ["@variable.builtin"] = { fg = colors.syntax.variable, italic = true },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { fg = colors.syntax.constant, italic = true },
        ["@constant.macro"] = { fg = colors.syntax.preproc },
        ["@namespace"] = { fg = colors.syntax.type },
        ["@symbol"] = { fg = colors.ui.accent },
        ["@text"] = { fg = colors.fg.primary },
        ["@text.title"] = { link = "Title" },
        ["@text.literal"] = { fg = colors.syntax.string },
        ["@text.uri"] = { fg = colors.syntax.string, underline = true },
        ["@text.math"] = { fg = colors.syntax.function_name },
        ["@text.environment"] = { fg = colors.syntax.keyword },
        ["@text.environment.name"] = { fg = colors.syntax.type },
        ["@text.reference"] = { fg = colors.ui.accent, underline = true },
        ["@text.todo"] = { link = "Todo" },
        ["@text.note"] = { fg = colors.ui.info, bold = true },
        ["@text.warning"] = { fg = colors.ui.warning, bold = true },
        ["@text.danger"] = { fg = colors.ui.error, bold = true },
        ["@text.diff.add"] = { link = "DiffAdd" },
        ["@text.diff.delete"] = { link = "DiffDelete" },
        ["@tag"] = { link = "Tag" },
        ["@tag.attribute"] = { fg = colors.syntax.variable },
        ["@tag.delimiter"] = { fg = colors.syntax.operator },
      }

      -- Apply highlights
      for group, styles in pairs(highlight_groups) do
        vim.api.nvim_set_hl(0, group, styles)
      end
    end

    -- Initialize the color scheme
    obsidian.setup()
  end,
}
