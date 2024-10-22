-- Function to manage all programming quotes
local function get_quotes()
  return {
    { text = "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.", author = "- Brian Kernighan" },
    { text = "Don’t comment bad code – rewrite it.", author = "- Brian Kernighan" },
    { text = "No one in the brief history of computing has ever written a piece of perfect software. It’s unlikely that you’ll be the first.", author = "- Andy Hunt" },
    { text = "A programming language is for thinking about programs, not for expressing programs you’ve already thought of. It should be a pencil, not a pen.", author = "- Paul Graham" },
    { text = "Sometimes it pays to stay in bed on Monday rather than spending the rest of the week debugging Monday’s code.", author = "- Dan Salomon" },
    { text = "Bad programmers worry about the code. Good programmers worry about data structures and their relationships.", author = "- Linus Torvalds" },
    { text = "Debugging becomes significantly easier if you first admit that you are the problem.", author = "- William Laeder" },
    { text = "It’s better to wait for a productive programmer to become available than it is to wait for the first available programmer to become productive.", author = "- Steve McConnell" },
    { text = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.", author = "- Martin Fowler" },
    { text = "One of my most productive days was throwing away 1000 lines of code.", author = "- Ken Thompson" },
    { text = "Everyday life is like programming, I guess. If you love something, you can put beauty into it.", author = "- Donald Knuth" },
    { text = "Everybody in this country should learn to program a computer because it teaches you how to think.", author = "- Steve Jobs" },
    { text = "System programmers are the high priests of a low cult.", author = "- Robert S. Barton" },
    { text = "A good programmer is someone who always looks both ways before crossing a one-way street.", author = "- Doug Linder" },
    { text = "I don’t care if it works on your machine! We are not shipping your machine.", author = "- Vidiu Platon" },
    { text = "Fix the cause, not the symptom.", author = "- Steve Maguire" },
    { text = "Measuring programming progress by lines of code is like measuring aircraft building progress by weight.", author = "- Bill Gates" },
    { text = "In programming, the hard part isn’t solving problems but deciding what problems to solve.", author = "- Paul Graham" },
    { text = "First, solve the problem. Then, write the code.", author = "- John Johnson" },
    { text = "The computer was born to solve problems that did not exist before.", author = "- Bill Gates" },
    { text = "Make it work, make it right, make it fast.", author = "- Kent Beck" },
    { text = "Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.", author = "- Rick Osborne" },
    { text = "People don’t care about what you say, they care about what you build.", author = "- Mark Zuckerberg" },
    { text = "As a programmer, it is your job to put yourself out of business. What you do today can be automated tomorrow.", author = "- Doug McIlroy" },
    { text = "We have to stop optimizing for programmers and start optimizing for users.", author = "- Jeff Atwood" },
    { text = "There is a big difference between making a simple product & making a product simple.", author = "- Des Traynor" },
    { text = "If the code and the comments do not match, possibly both are incorrect.", author = "- Norm Schryer" },
    { text = "Before software can be reusable, it first has to be usable.", author = "- Ralph Johnson" },
    { text = "If you optimize everything, you will always be unhappy.", author = "- Donald Knuth" },
    { text = "Your mind is programmable – if you’re not programming your mind, someone else will program it for you.", author = "- Jeremy Hammond" },
    { text = "Experience is the name everyone gives to their mistakes.", author = "- Oscar Wilde" },
    { text = "The trouble with programmers is that you can never tell what a programmer is doing until it’s too late.", author = "- Seymour Cray" },
    { text = "Testing can only prove the presence of bugs, not their absence.", author = "- Edsger W. Dijkstra" },
    { text = "Talk is cheap. Show me the code.", author = "- Linus Torvalds" },
    { text = "The function of good software is to make the complex appear simple.", author = "- Grady Booch" },
    { text = "Your most unhappy customers are your greatest source of learning.", author = "- Bill Gates" },
    { text = "Small minds are concerned with the extraordinary, great minds with the ordinary.", author = "- Blaise Pascal" },
    { text = "Active programming consists of designing new programs rather than contemplating old ones.", author = "- Niklaus Wirth" },
    { text = "Making code do what it’s supposed to do is the easy part. Handling the myriad ways it can go wrong is the real work.", author = "- Aaron Lozier" },
    { text = "Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun.", author = "- Linus Torvalds" },
    { text = "It is far, far easier to make a correct program fast than to make a fast program correct.", author = "- Herb Sutter" },
    { text = "Every great developer you know got there by solving problems they were unqualified to solve until they actually did it.", author = "- Patrick McKenzie" },
    { text = "C makes it easy to shoot yourself in the foot; C++ makes it harder, but when you do, it blows away your whole leg.", author = "- Bjarne Stroustrup" },
    { text = "Programs must be written for people to read, and only incidentally for machines to execute.", author = "- Harold Abelson" },
    { text = "In programming, if someone tells you you’re overcomplicating it, they’re either 10 steps behind you or 10 steps ahead of you.", author = "- Andrew Clark" },
    { text = "Truth can only be found in one place: the code.", author = "- Robert C. Martin" },
  }
end

-- Function to select a random quote
local function get_random_quote()
  local quotes = get_quotes()
  math.randomseed(os.time())
  return quotes[math.random(#quotes)]
end

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Function to wrap text to a given width
    local function wrap_text(text, width)
      local lines = {}
      for line in text:gmatch("[^\n]+") do
        while #line > width do
          local cut_point = line:sub(1, width):match("^.*() ") or width
          table.insert(lines, line:sub(1, cut_point))
          line = line:sub(cut_point + 1)
        end
        table.insert(lines, line)
      end
      return lines
    end

    -- Calculate dynamic padding for centering
    local function center_padding()
      local total_height = vim.fn.winheight(0)
      local content_height = 32 -- Approximate number of lines for the dashboard (header + buttons)
      return math.max(0, math.floor((total_height - content_height) / 2))
    end

    -- Get random quote and wrap the text
    local quote = get_random_quote()
    local wrapped_quote = wrap_text(quote.text, 60)
    table.insert(wrapped_quote, "") -- Blank line before the author
    table.insert(wrapped_quote, quote.author) -- Add the author on its own line

    -- Apply dynamic padding to center content
    dashboard.opts.layout = {
      { type = "padding", val = center_padding() }, -- Dynamic padding for centering
      dashboard.section.header,
      { type = "padding", val = 2 },
      {
        type = "text",
        val = wrapped_quote, -- Use wrapped quote with author
        opts = {
          position = "center", -- Center the text horizontally
          hl = "DashboardCenter", -- Use the same highlight group as buttons
        },
      },
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- Buttons with Telescope and other useful commands
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- Helper function for utf8 chars
    local function getCharLen(s, pos)
      local byte = string.byte(s, pos)
      if not byte then return nil end
      return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
    end

    local function applyColors(logo, colors, logoColors)
      dashboard.section.header.val = logo

      for key, color in pairs(colors) do
        local name = "Alpha" .. key
        vim.api.nvim_set_hl(0, name, color)
        colors[key] = name
      end

      dashboard.section.header.opts.hl = {}
      for i, line in ipairs(logoColors) do
        local highlights = {}
        local pos = 0

        for j = 1, #line do
          local opos = pos
          pos = pos + getCharLen(logo[i], opos + 1)
          local color_name = colors[line:sub(j, j)]
          if color_name then
            table.insert(highlights, { color_name, opos, pos })
          end
        end

        table.insert(dashboard.section.header.opts.hl, highlights)
      end
      return dashboard.opts
    end

    -- Apply the logo and colors (as before)
    alpha.setup(applyColors({
      [[  ███       ███  ]],
      [[  ████      ████ ]],
      [[  ████     █████ ]],
      [[ █ ████    █████ ]],
      [[ ██ ████   █████ ]],
      [[ ███ ████  █████ ]],
      [[ ████ ████ ████ ]],
      [[ █████  ████████ ]],
      [[ █████   ███████ ]],
      [[ █████    ██████ ]],
      [[ █████     █████ ]],
      [[ ████      ████ ]],
      [[  ███       ███  ]],
      [[                    ]],
      [[  N  E  O  V  I  M  ]],
      }, {
        ["b"] = { fg = "#3399ff", ctermfg = 33 },
        ["a"] = { fg = "#53C670", ctermfg = 35 },
        ["g"] = { fg = "#39ac56", ctermfg = 29 },
        ["h"] = { fg = "#33994d", ctermfg = 23},
        ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29},
        ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
        ["k"] = { fg = "#30A572", ctermfg = 36},
      }, {
        [[  kkkka       gggg  ]],
        [[  kkkkaa      ggggg ]],
        [[ b kkkaaa     ggggg ]],
        [[ bb kkaaaa    ggggg ]],
        [[ bbb kaaaaa   ggggg ]],
        [[ bbbb aaaaaa  ggggg ]],
        [[ bbbbb aaaaaa igggg ]],
        [[ bbbbb  aaaaaahiggg ]],
        [[ bbbbb   aaaaajhigg ]],
        [[ bbbbb    aaaaajhig ]],
        [[ bbbbb     aaaaajhi ]],
        [[ bbbbb      aaaaajh ]],
        [[  bbbb       aaaaa  ]],
        [[                    ]],
        [[  a  a  a  b  b  b  ]],
    }))
  end,
}

