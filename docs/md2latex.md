---
title: "Title of the Paper"
author: "Author Name"
date: 2026-01-XX
bibliography: references.bib
---

# Introduction

> 这是一个示例，展示了如何编写兼容pandox可转化为正确latex的markdown文件

本文研究高维随机电路性能在 **high-sigma** 条件下的统计建模与分析问题。  
在先进 SRAM 设计中，性能指标往往可表示为高维随机变量的非线性映射  
\(\,y = f(X)\,\)，其中 \(X\) 表示工艺随机参数向量。

已有研究表明，该类问题在尾部区域（tail region）具有显著的非高斯行为
[@wang2011; @venugopalan2013]。

> ⚠️ 注意  
> - 行内公式统一使用 `\(...\)`  
> - 不使用 `$...$`  

---

# Problem Formulation

设随机向量 \(X \in \mathbb{R}^d\)，其联合分布由工艺模型给出。
定义性能指标 \(Y = f(X)\)，并给定失效区域 \(\Omega\)。

我们关心的核心概率为失效概率  
\(\,P_{\mathrm{fail}} = P(Y \in \Omega)\)。

---

## Indicator Function Definition

为便于后续推导，引入指标函数（indicator function）定义如下：

$$
I(X) =
\begin{cases}
1, & Y(X) \in \Omega \\
0, & Y(X) \notin \Omega
\end{cases}
$$

> ⚠️ 注意  
> - 草稿阶段 **不写公式编号**
> - 不使用 `$$ ... $$ {#eq:...}`  
> - 编号留到 LaTeX 阶段统一处理  

---

## Failure Probability Expression

基于上述定义，失效概率可写为：

$$
\begin{aligned}
P_{\mathrm{fail}}
&= P(Y \in \Omega) \\
&= \int_{\Omega} f(X)\,dX \\
&= \int_{-\infty}^{+\infty} I(X)\,f(X)\,dX
\end{aligned}
$$

> ⚠️ 注意  
> - `&` 只能出现在 `aligned` 中  
> - 不在 `$$` 内直接写 `&`  

---

# Ranking-Based High-Sigma Monte Carlo

在有限仿真预算条件下，传统 Monte Carlo 方法难以直接观测  
\(\,6\sigma\) 甚至更高 sigma 区域的极端样本。

为此，引入基于排序的 High-Sigma Monte Carlo（HSMC）方法，
其核心思想是优先仿真 **预测最差的样本子集**。

---

## Key Sets and Notation

- \(\mathcal{E}^*\)：真实的极端样本集合（失效样本集合）
- \(\hat{r}(x)\)：代理模型预测的样本排序名次
- \(K\)：每轮仿真预算规模

> ⚠️ 注意  
> - 列表中使用数学符号时，仍使用 `$begin:math:text$\.\.\.$end:math:text$`  
> - 不要写 `$ \mathcal{E}^* $`  

---

## Practical Pitfall

一种常见但隐蔽的做法是：  
仅在代理模型预测排名前 \(\,K\) 的样本上估计排序误差，
即将误差估计限制在集合  
\(\,\{x : \hat{r}(x) \le K\}\)。

然而，该做法存在根本缺陷：  
**若真实极端样本被错排至 \(\hat{r}(x) > K\)，
则其排序误差无法被观测。**

---

# Figures

下图示意了 SRAM Read Current 在低电压条件下的统计分布形态。

![Read current distribution under low VDD](figs/read_current.png)

> ⚠️ 注意  
> - 草稿阶段不强制引用图编号  
> - 正文中写“如图所示”即可  

---

# Tables

下表给出了不同 sigma 等级下的理论失效概率。

| Sigma level | Failure probability |
|------------:|--------------------:|
| 3σ          | \(2.7\times10^{-3}\) |
| 6σ          | \(1.0\times10^{-9}\) |

: Failure probability at different sigma levels

---

# Related Work

SRAM 读电流的统计变异性已在多项工作中被系统研究
[@fischer2008; @wang2011; @venugopalan2013]。
这些研究揭示了在近阈值区域，
读路径的等效堆叠结构会引入显著的负反馈效应。

---

# Conclusion

本文从统计建模与算法设计角度，
系统分析了排序误差对 High-Sigma Monte Carlo 方法可靠性的影响，
并指出在尾部区域必须显式控制漏检风险。

---

# References