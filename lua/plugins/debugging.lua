-- needs brew install llvm
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",           -- DAP UI for better debugging visuals
    "theHamsta/nvim-dap-virtual-text", -- Inline debug information
    "stevearc/overseer.nvim",         -- Task management for builds
    "nvim-neotest/nvim-nio",          -- Required dependency for dap-ui
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local overseer = require("overseer")

    -- Configure dap to use LLDB
    dap.adapters.lldb = {
      type = "executable",
      command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- Path to LLDB (adjust if necessary)
      name = "lldb"
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp

    -- Load launch.json from the .vscode directory
    require("dap.ext.vscode").load_launchjs(nil, { lldb = { "c", "cpp" } })

    -- Configure Overseer
    overseer.setup()

    -- Keybinding for running tasks from tasks.json
    vim.keymap.set("n", "<leader>bb", ":OverseerRun Build<CR>", {
      noremap = true,
      silent = true,
      desc = "Run Build Task from tasks.json",
    })

    -- Configure dap-ui
    dapui.setup()

    -- Automatically open/close dap-ui
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Configure debugging symbols for nvim-dap
    vim.fn.sign_define("DapBreakpoint", { text = "B" })
    vim.fn.sign_define("DapStopped", { text = "=>" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "C" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "!" })

    -- Key mappings for DAP
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Conditional Breakpoint" })
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Set Log Point" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last Debugging Session" })
    vim.keymap.set("n", "<leader>dut", dapui.toggle, { desc = "Toggle DAP UI" })
  end,
}

