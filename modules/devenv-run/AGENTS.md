## devenv-run

- Helper `devenv-run`: run repo's devenv without shellHook or enterShell side effects (formatters etc)
- Usage `devenv-run [-C repo_root] [--] <command> [args...]`
- Example `devenv-run -C repos/rust-app cargo build --workspace`
