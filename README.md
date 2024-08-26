# markdown-writing
Tools to facilitate markdown writing 

# pandocx - Pandoc Markdown to Microsoft Word (docx)

- Currently, this script is only tested on macOS. It should theoretically work on other platforms (Linux) as long as you're using bash. If you encounter any issues, please submit an issue.
- Before using this script, make sure to install [pandoc](https://pandoc.org/) and [pandoc-crossref](https://lierdakil.github.io/pandoc-crossref/).
- Copy the `pandocx` file to `/usr/local/bin` or any other directory in your system's PATH (if you prefer not to copy, you can create a symbolic link using `ln -s /path/to/pandocx /usr/local/bin/pandocx`).
- Next, copy the entire `panlib` directory to the project directory where you're writing your documents. Then, replace or modify the contents of the files in this directory according to your needs:
  - `bibtex.bib`: Bibliography file for references. Replace it with your own (you can export from Zotero).
  - `config.yaml`: Metadata for your document, defining the title, format, and various configuration options. Modify it according to your requirements.
  - `crossref.yaml`: Cross-referencing configuration file. Modify it as needed.
  - `page-and-line-break.lua`: Filter for handling page and line breaks. It's recommended not to modify this file.
  - `reference.csl`: Citation style file for references (the default is `chinese-gb7714-2015-numeric.csl`). Replace or modify it according to your needs.
  - `template.docx`: Template for the exported Word document. Modify or replace it as needed.
- After configuring everything, you can start writing in markdown in your project directory.
- This script supports converting a single markdown file to a docx file and also supports merging multiple markdown documents before conversion. For detailed usage instructions, use the `pandocx -h` command.

# pandocx - Markdown 转微软 Word（docx）

- 目前仅在MacOS上调试，其它平台（Linux）只要你使用bash，理论上也能运行。如果遇到问题请提issue
- 使用本脚本前，需要安装 [pandoc](https://pandoc.org/) 和 [pandoc-crossref](https://lierdakil.github.io/pandoc-crossref/)
- 请将`pandocx`文件拷贝到`/usr/local/bin`或你电脑其它任何可执行的目录下（如果你不想拷贝，也可以使用符号链接`ln -s /path/to/pandocx /usr/local/bin/pandocx`）
- 然后将`panlib`目录整个拷贝到你写文档的项目目录，并根据你的需要替换或修改目录下的文件内容
  - `bibtex.bib` : 引用的参考文献库，请替换（可以使用Zotero导出）
  - `config.yaml`： 文稿的元数据metadata，定义了文档标题、格式等系列配置选项，请根据实际需要修改
  - `crossref.yaml`： 交叉引用配置文件，请根据实际需要修改
  - `page-and-line-break.lua`： 处理分页和换行的过滤器，最好不要修改
  - `reference.csl`： 参考文献引用样式（缺省为`chinese-gb7714-2015-numeric.csl`），请根据需要修改或者替换
  - `template.docx`： 导出的word文档模板，请根据需要修改或者替换
- 配置完成后，你就可以在你的项目目录下使用markdown写作了。
- 本脚本支持单个markdown文件转化为docx，也支持将多个markdown文档合并后转化为docx，具体请使用`pandocx -h`命令查看使用说明

# Usage help doc 
```shell
Pandoc Markdown To Word (docx)

Usage:
     pandocx [-i <input-markdown-files...>] [--backup=true|false]
Options:
     -i <input-markdown-files...>  Specify the Markdown files to convert. You can specify multiple Markdown files.
                                   If not provided, all .md files in the current directory will be used.
     --backup=true|false           If true or not set, will back up the existing exported.docx before overwriting. Default is true.

Note:
     Please put the corresponding BibTex lib under the 'panlib' folder with name of 'bibtex.bib'
```