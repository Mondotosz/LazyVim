return {
  "Civitasv/cmake-tools.nvim",
  keys = {
    {
      "<leader>Cc",
      function()
        local buf = vim.api.nvim_get_current_buf()

        if
          vim.api.nvim_get_option_value("modifiable", { buf = buf })
          and vim.api.nvim_get_option_value("modified", { buf = buf })
        then
          vim.cmd("w")
        end

        vim.cmd("CMakeBuild")
        local cmake = require("cmake-tools")
        vim.notify("Building " .. cmake.get_build_target() .. " in " .. cmake.get_build_type(), vim.log.levels.INFO)
      end,
      desc = "Cmake build",
    },
    { "<leader>Cr", "<cmd>CMakeRun<cr>", desc = "Cmake run" },
    { "<leader>Ct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Cmake select build target" },
    { "<leader>CT", "<cmd>CMakeSelectBuildType<cr>", desc = "Cmake select build type" },
    {
      "<leader>CC",
      function()
        local cmake = require("cmake-tools")
        cmake.generate({}, function()
          cmake.select_build_type(function()
            cmake.select_build_target(function()
              cmake.select_launch_target(function()
                local args = vim.fn.input("Args: ")
                vim.api.nvim_command("CMakeLaunchArgs " .. args)
              end, true)
            end, true)
          end)
        end)
      end,
      desc = "Cmake configure",
    },
    {
      "<leader>Cq",
      function()
        local qf_exists = false
        for _, win in pairs(vim.fn.getwininfo()) do
          if win["quickfix"] == 1 then
            qf_exists = true
          end
        end
        if qf_exists == true then
          vim.cmd("cclose")
          return
        end
        if not vim.tbl_isempty(vim.fn.getqflist()) then
          vim.cmd("copen")
        end
      end,
      desc = "Toggle quickfix window",
    },
    {
      "<leader>Ca",
      function()
        local args = vim.fn.input("Args: ")
        vim.api.nvim_command("CMakeLaunchArgs " .. args)
      end,
      desc = "Cmake set launch arguments",
    },
    { "<leader>Cg", "<cmd>CMakeGenerate<cr>", desc = "Cmake Generate" },
  },
  dependencies = { "akinsho/toggleterm.nvim", "stevearc/overseer.nvim" },
  opts = {
    cmake_build_directory = "build/${variant:buildType}",
    cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
    cmake_compile_commands_from_lsp = false,
    cmake_runner = {
      name = "overseer",
      opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
      default_opts = { -- a list of default and possible values for runners
        overseer = {
          new_task_opts = {
            strategy = {
              "toggleterm",
              direction = "horizontal",
              autos_croll = true,
              quit_on_exit = false,
            },
          }, -- options to pass into the `overseer.new_task` command
          -- on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
        },
      },
    },
    cmake_executor = { -- executor to use
      name = "overseer", -- name of the executor
      opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
      default_opts = { -- a list of default and possible values for executors
        quickfix = {
          show = "always", -- "always", "only_on_error"
          position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
          size = 10,
          encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
          auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
        },
        overseer = {
          new_task_opts = {
            strategy = {
              "toggleterm",
              direction = "horizontal",
              autos_croll = true,
              quit_on_exit = "success",
            },
          }, -- options to pass into the `overseer.new_task` command
          -- on_new_task = function(task)
          --   require("overseer").open({ enter = false, direction = "left" })
          -- end, -- a function that gets overseer.Task when it is created, before calling `task:start`
        },
      },
    },
    cmake_notifications = {
      runner = { enabled = false },
      executor = { enabled = true },
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
      refresh_rate_ms = 200, -- how often to iterate icons
    },
  },
}
