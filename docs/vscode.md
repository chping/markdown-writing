
# 设置快捷键快速输入Latex括号

- 打开keybingings.json文件，插入下面的内容
- 之后在编辑Markdown和Latex文件时，即可快速输入各种括号，且光标停留在括号中间
    - 按键`Ctrl + Alt + [`，即可以输入`\left[\right]`
    - 按键`Ctrl + Shift + Alt + [`，即可以输入`\left{\right}`
    - 按键`Ctrl + Shift + Alt + 9`，即可以输入`left(\right)`

```json
// Place your key bindings in this file to override the defaults
[
    {
    "key": "ctrl+alt+[",
    "command": "editor.action.insertSnippet",
    "when": "editorLangId == latex || editorLangId ==markdown && editorTextFocus",
    "args": {
        "snippet": "\\left[$0\\right]"
    }
},
    {
    "key": "ctrl+shift+alt+[",
    "command": "editor.action.insertSnippet",
    "when": "editorLangId == latex || editorLangId == markdown && editorTextFocus",
    "args": {
        "snippet": "\\left\\{$0\\right\\}"
    }
},
    {
    "key": "ctrl+shift+alt+9",
    "command": "editor.action.insertSnippet",
    "when": "editorLangId == latex || editorLangId == markdown && editorTextFocus",
    "args": {
        "snippet": "\\left($0\\right)"
    }
}
]
```