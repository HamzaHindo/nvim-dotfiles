return {
    "A7Lavinraj/assistant.nvim",
    branch = "stable",
    lazy = false,
    keys = {
        { "<leader>a", "<cmd>Assistant<cr>", desc = "Assistant.nvim" },
    },
    opts = {
        commands = {
            cpp = {
                extension = "cpp",
                template = [[#include <bits/stdc++.h>
using namespace std;

void solve() {
    
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    int t = 1;
    // cin >> t;
    while (t--) {
        solve();
    }
    return 0;
}
]],
                compile = {
                    main = "g++",
                    args = { "$FILENAME_WITH_EXTENSION", "-o", "$FILENAME_WITHOUT_EXTENSION", "-std=c++17", "-O2", "-Wall", "-Wextra", "-Wshadow" },
                },
                execute = {
                    main = "./$FILENAME_WITHOUT_EXTENSION",
                    args = nil,
                },
            },
            python = {
                extension = "py",
                template = [[import sys
input = sys.stdin.readline

def solve():
    pass

if __name__ == "__main__":
    solve()
]],
                compile = nil,
                execute = {
                    main = "python3",
                    args = { "$FILENAME_WITH_EXTENSION" },
                },
            },
        },
        ui = {
            border = "rounded",
            diff_mode = false,
            title_components_separator = "",
        },
        core = {
            process_budget = 5000,
            port = 10043,
        },
    },
}
