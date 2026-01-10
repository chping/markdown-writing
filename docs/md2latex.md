
# Markdown → Pandoc → LaTeX 写作注意事项清单

> 目标：
>
> - Markdown 阶段可读、可正常渲染
> - Pandoc 转换过程稳定、不引入语法错误
> - LaTeX 阶段可精确控制编号、引用与排版
> - 适用于论文、技术报告、学位论文写作流程

##  总体原则

- Markdown **只用于内容表达**，不承担精细排版职责
- 不在 Markdown 中强行“模拟 LaTeX 论文格式”
- 数学编号、交叉引用、浮动体控制统一交给 LaTeX
- **稳定性优先于语法美观**

## 1. 行内公式（Inline Math）

### ✅ 推荐写法

```markdown
$a + b$
```

### ❌ 禁止写法

```markdown
\( a + b \)
```

**原因说明：**

-  `$...$` 在 Markdown / Pandoc / LaTeX 全链路兼容
-  `\(...\)` 在多数 Markdown 渲染器中无法识别
-  使用 `\(...\)` 极易导致 Pandoc 或编辑器渲染异常
    
## 2. 行间公式（Display Math）

### ✅ 推荐写法

```markdown
$$
E = mc^2
$$
```

- Pandoc 可稳定转换为 LaTeX display math
- 主流 Markdown 编辑器可正常预览

## 3. 多行公式与对齐（高风险区域）

### ❌ 错误写法（一定会导致 LaTeX 报错）

```markdown
$$
P_{fail} & = \int f(x)\,dx
$$
```

**问题原因：**

- `&` 只能出现在 `aligned / align` 等环境中  
- 单独使用 `$$ ... $$` 时不能直接对齐

### ✅ 正确写法（唯一安全方式）

```markdown
$$
\begin{aligned}
P_{\mathrm{fail}}
&= P(Y \in \Omega) \\
&= \int_{\Omega} f(X)\, dX \\
&= \int_{-\infty}^{+\infty} I(X) f(X)\, dX
\end{aligned}
$$
```

## 4. 公式编号（非常重要）

### ❌ Markdown 阶段禁止的写法

```markdown
$$
E = mc^2
$$ {#eq:energy}
```

**原因：**

*   Pandoc 对数学块 ID 的支持不稳定    
*   极易触发 `\mathcal allowed only in math mode` 等错误

### ✅ 正确策略（推荐流程）

*   Markdown 阶段：**不编号**
*   LaTeX 阶段统一编号：

```latex
\begin{equation}
E = mc^2
\label{eq:energy}
\end{equation}
```

## 5. 公式引用

### ✅ Markdown 中允许的写法（LaTeX 兼容）

```markdown
As shown in Eq.~\eqref{eq:energy}, the failure probability decreases.
```

*   Markdown 预览阶段仅作为普通文本
*   Pandoc 会原样保留
*   LaTeX 编译阶段生效

## 6. 中文与数学混排（XeLaTeX 场景）

### ❌ 错误写法

```markdown
$ 当 n > 0 时 $
```

### ✅ 正确写法

```markdown
当 $n > 0$ 时
```

**原则：**

*   数学环境中只出现数学符号    
*   中文始终放在数学环境外
    
## 7. 图片（Figures）

### ✅ 推荐写法

```markdown
![Yield vs sigma](figures/yield_sigma.png)
```

*   不在 Markdown 中强制编号    
*   不使用 `\label` / `\ref`
*   LaTeX 阶段统一使用 `figure` 环境处理
    

## 8. 表格（Tables）

### ✅ 简单表格（Markdown）

```markdown
| Sigma | Failure Probability |
|------:|--------------------:|
| 3σ    | 1.35e-3             |
| 6σ    | 9.9e-10             |
```

### ⚠️ 复杂表格（建议 LaTeX 阶段处理）

*   合并单元格
*   跨页表格
*   精细列对齐
*   注释与脚注
    
## 9. 参考文献（BibTeX / BibLaTeX）

### ✅ Pandoc 推荐引用方式

```markdown
This method follows @wang2011nongaussian.
```

### 多篇引用

```markdown
Several approaches have been proposed [@wang2011nongaussian; @venugopalan2013sram].
```

*   只关心 citation key 是否正确
*   引用样式由 LaTeX 决定
    
## 10. 代码块

```python
def estimate_failure():
    pass
```

- Pandoc 转换稳定
- LaTeX 阶段可选择 `listings` 或 `minted`

## 11. 明确禁止清单（高危写法）

❌ 行内公式使用 `\(...\)`  
❌ 在 `$$ ... $$` 中直接使用 `&`  
❌ Markdown 阶段给公式编号  
❌ 数学环境中混入中文  
❌ Markdown 中嵌套 `equation` / `align` 等 LaTeX 环境  


## 12. 推荐写作工作流（总结）

1. **Markdown 阶段**：专注内容与逻辑
2. **Pandoc 阶段**：仅做结构转换
3. **LaTeX 阶段**：统一编号、引用、排版、投稿格式

> **Markdown 负责「写清楚」  
> LaTeX 负责「排好看」**


