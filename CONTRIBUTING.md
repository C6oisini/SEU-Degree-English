# 贡献指南

这个仓库用「一人一部分」的方式协作，欢迎任何同学提 PR——包括不在原作者名单里的外部同学。

## 你只有两条路

| 身份 | 能做什么 | 怎么做 |
|------|----------|--------|
| 外部贡献者（没有写权限） | 在自己的 fork 里随便建分支，然后向本仓库提 PR | 见下面的「外部贡献者流程」 |
| 协作者（被加进 Settings → Collaborators） | 直接在本仓库推分支、开 PR | `git switch -c part-3-method && git push -u origin part-3-method` |

GitHub 没有「让陌生人直接往别人仓库推分支」的开关：公开仓库的默认协作模型就是 **fork + PR**，只有被加为 collaborator 的账号才有写权限。`main` 是唯一分支，请不要直接往 `main` 推东西。

## 外部贡献者流程

```bash
# 1. 在 GitHub 页面点 Fork，然后克隆自己的 fork
git clone https://github.com/<你的用户名>/SEU-Degree-English.git
cd SEU-Degree-English

# 2. 建分支（名字自己起，见下面的命名约定）
git switch -c part-3-method

# 3. 改完、能编译、提交
latexmk -pdf paper.tex
git add -A
git commit -m "Part 3: methodology skeleton"

# 4. 推到自己 fork，然后开 PR
git push -u origin part-3-method
```

推完之后到 GitHub 上打开 Pull Request，base 选 `C6oisini/SEU-Degree-English` 的 `main`，head 选你的分支。第一次给别人的仓库提 PR，GitHub 会要求你确认一下 workflow 运行权限（点 approve 即可）。

## 分支命名

- `part1-intro` … `part7-polish`：按分工表的部分改内容
- `fix/<简短说明>`：修排版、修引用、修 CI
- `docs/<简短说明>`：只改 README / 注释

## 改哪些文件

每个成员只改 `sections/` 里属于自己的那一个文件：

```
sections/00-abstract.tex      第 7 部分（摘要 + 统稿）
sections/01-introduction.tex  第 1 部分
sections/02-literature-review.tex
sections/03-methodology.tex
sections/04-results.tex
sections/05-discussion.tex
sections/06-conclusion.tex
```

公共文件（`paper.tex`、`uiuc_paper.cls`、`macro.tex`、`main.bib`、`figs/`）的改动会同时影响所有人，改之前请在 PR 描述里说明原因，必要时先开 issue 讨论。

## PR 要求

- **必须能编译**：CI 会在每个 PR 上跑 `latexmk -pdf paper.tex`，红了就是编译不过，先本地跑通再提。
- **不要提交中间文件**：`.gitignore` 已经挡住 `*.aux / *.log / *.out / *.fls / *.fdb_latexmk` 等；如果误提交了，`git rm --cached <文件>`。
- **正文英文，注释中文**：源码里出现中文只放在 `%` 注释里，`pdflatex` 排不了中文。
- **交稿前清 `\todo`**：正文里那行红字 `\todo{PART N --- ...}` 是占位，写正文时删掉；PR 合并前 `grep -rn "TODO" sections/` 应该只剩注释里的说明。
- **图表用项目约定**：表格 `booktabs`，交叉引用 `\cref{}`，图标题写成 `\caption{\textbf{标签} 说明}`。

## 评审与合并

- 仓库维护者会看 PR，通常会要求「能编译 + 没越界改别人的文件」两条。
- 合并方式默认 **Squash and merge**，一个 PR 一条提交，`main` 的历史保持干净。
- 如果你的 PR 只改了注释或 README，可以标注 `docs`，维护者可以直接合并。
