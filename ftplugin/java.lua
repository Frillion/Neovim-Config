local config = {
    cmd = {'/path/to/jdt-language-server/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    config['init_options'] = {
      bundles = {
        vim.fn.glob("path/to/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
      };
    },
}
require('jdtls').start_or_attach(config)
require('jdtls.dap').setup_dap_main_class_configs()

vim.keymap.set("v", "<leader>xm", "<cmd>lua require('jdtls').extract_method(true)<CR>", {desc="Extracts code under cursor to a new method(java only)"})
