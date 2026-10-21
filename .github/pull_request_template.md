## 改了什么

<!-- 一句话说明，例如：写了第 3 部分 Methodology 的前两段 -->

## 涉及的部分

- [ ] 1 Introduction
- [ ] 2 Literature Review
- [ ] 3 Methodology
- [ ] 4 Results
- [ ] 5 Discussion
- [ ] 6 Conclusion
- [ ] 7 Abstract / 统稿
- [ ] 公共文件（`paper.tex` / `uiuc_paper.cls` / `macro.tex` / `main.bib` / `figs/`）——请在下面说明原因

## 自查

- [ ] 本地 `latexmk -pdf paper.tex` 能编译通过（CI 也会跑）
- [ ] 只改了自己负责的 `sections/*.tex`，没有动别人的文件
- [ ] 正文里的 `\todo{PART N ...}` 占位已删除
- [ ] 新增的引用都进了 `main.bib`，且 `\citep` 的 key 拼写正确
- [ ] 没有提交 `*.aux` / `*.log` / `*.out` 等中间文件

## 附注

<!-- 截图、需要 reviewer 注意的地方、已知问题 -->
