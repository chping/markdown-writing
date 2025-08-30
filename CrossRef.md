以下是一份关于 在 Markdown 中使用 pandoc‑crossref 实现公式、图片、表格交叉引用 的简明手册，明确说明语法要点、示例、以及 LaTeX/PDF 与 Word 输出时的兼容性保障：

⸻

简明手册：Pandoc-crossref 交叉引用

1. 安装与使用方式
	•	安装 pandoc-crossref 过滤器，并通过以下命令使用：

pandoc input.md -o output.pdf --filter pandoc-crossref

可选结合 --citeproc 使用，确保先应用交叉引用后再处理文献引用。 ￼ ￼

⸻

2. 标记对象（图、表、公式）

图片（图）
	•	语法：

![Caption](path/to/image.png){#fig:label}


	•	要求：必须是独立一段的“隐式图片”，后面紧跟标签（可以有空格）。 ￼ ￼

公式
	•	语法：

$$ 
E = mc^2
$$ {#eq:einstein}


	•	要求：公式块独立一段，标签紧随块后。 ￼

表格
	•	语法：

| A | B |
|---|---|
| 1 | 2 |

: Caption text {#tbl:label}


	•	将表格内容与标题（带标签）分成两段。 ￼

⸻

3. 在文本中引用（文中交叉引用）

使用 @ 加标签引用：

如图 @fig:label 所示……
在式 @eq:einstein 中……
参见表 @tbl:label

支持多项引用合并，例如：

参见 [@fig:label; @tbl:label; @eq:einstein]

首次引用时大小写自动处理。 ￼ ￼

⸻

4. 输出格式兼容性
	•	LaTeX / PDF：pandoc‑crossref 自动生成 \label{…} 与 \ref{…}，编号正常显示，标题前缀自动处理。 ￼
	•	Word (docx)：引用会变成类似“Figure 1”或“(1)”的文本/超链接，编号一致，不依赖 Word 域，无需额外更新操作。 ￼

⸻

5. 示例汇总

---
title: "交叉引用示例"
linkReferences: true
---

## 示例内容

以下为图、表、公式的例子：

![示例图片](image.png){#fig:demo}

如图 @fig:demo 所示，……

$$
y = mx + b
$$ {#eq:line}

在式 @eq:line 中，……

| X | Y |
|---|---|
| 1 | 2 |

: 示例表格 {#tbl:demo}

见表 @tbl:demo。


⸻

6. 小结对照表

对象类型	标记方式	引用形式	注意事项
图片	![...](...){#fig:...}	@fig:...	独立段落，隐式图片
公式	$$...$$ {#eq:...}	@eq:...	独立块、公式标签
表格	表 + : Caption {#tbl:...}	@tbl:...	标题与表格分段
通用	@fig:..., @eq:..., @tbl:...	—	引用大小写自动处理


⸻

按照以上手册，你可以确保在 Markdown 中编写的图、表、公式交叉引用，在使用 pandoc-crossref 过滤器导出的 LaTeX (PDF) 和 Word (.docx) 两种格式中都保持正确、自动编号与链接。如果你需要中文版（如前缀“图”、“表”、“式”）或章节引用的例子，我可以一并提供。