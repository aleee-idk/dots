return {
    firefox = function(source_name)
        local dap = require("dap")
        dap.adapters.firefox = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/firefox-debug-adapter" },
        }

        dap.configurations.javascriptreact = {
            {
                name = "Debug with Firefox",
                type = "firefox",
                request = "launch",
                reAttach = true,
                url = "http://localhost:3000",
                webRoot = "${workspaceFolder}",
                firefoxExecutable = "/usr/bin/firefox-developer-edition",
            },
        }
    end,
}
