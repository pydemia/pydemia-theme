
Ctrl+V is binded to workbench.action.terminal.paste and this is one of default actions whose keybinding will be intercepted and handled by VS Code.
Use next setting to exclute it from the list (will effectively disabled paste with Ctrl+V to the terminal)

"terminal.integrated.commandsToSkipShell": [
    "-workbench.action.terminal.paste"
]
See details: https://code.visualstudio.com/docs/editor/integrated-terminal#_forcing-key-bindings-to-pass-through-the-terminal
