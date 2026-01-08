return {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = {
        'html',
        'css',
        'scss',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte',
        'vue',
    },
    root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts', 'postcss.config.js', '.git' },
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    'clsx\\(([^)]*)\\)',
                    'tw`([^`]*)`',
                    'tw="([^"]*)"',
                    'tw={`([^`]*)`}',
                    'className="([^"]*)"',
                    'className={`([^`]*)`}',
                    'cva\\(([^)]*)\\)',
                },
            },
            validate = true,
        },
    },
}
