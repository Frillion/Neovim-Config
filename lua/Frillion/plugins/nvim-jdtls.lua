return {
    'mfussenegger/nvim-jdtls',
    dependencies = {
        'mfussenegger/nvim-dap'
    },
    ft='java',
    config = function()
        local data_dir = vim.fn.stdpath("data")
        local jdtls_bin = data_dir .. "/mason/bin/jdtls"
        local config = {
            cmd = {
                jdtls_bin,
                '-jar','/home/Frillion/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.1100.v20240722-2106.jar',
                '-configuration', '/home/Frillion/.local/share/nvim/mason/packages/jdtls/config_linux/',
                init_options = {
                    bundles = {
                        vim.fn.glob("/home/Frillion/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
                        vim.split(vim.fn.glob("/home/Frillion/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
                    }
                },
            },
            root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
        }
        config.settings = {
            java = {
              project = {
                referencedLibraries = {
                  '/usr/local/lift/lib/algs4.jar',
                },
        }
    }
  }
        require('jdtls').start_or_attach(config)   
        require('jdtls').setup_dap()
    end
}

