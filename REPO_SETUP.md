# GitHub 发布说明

这个目录已经适合直接作为 GitHub 仓库使用。

## 发布前建议确认

### 1. 许可证

如果你准备公开发布，最好补一个许可证文件。

常见选择：

- `MIT`
  最宽松，别人可自由使用、修改、商用，保留署名即可。
- `Apache-2.0`
  也很宽松，并且对专利条款更完整。
- `不放 LICENSE`
  默认就是“保留所有权利”，别人能看，但法律上不等于可自由使用。

### 2. 仓库名建议

可选名字：

- `novel-writing-toolkit`
- `webnovel-writing-toolkit`
- `qimao-novel-writing-toolkit`

## 本地初始化 Git

在当前目录执行：

```bash
cd shareable-novel-toolkit
git init
git add .
git commit -m "Initial commit"
```

## 推到 GitHub

### 方式一：网页创建仓库后推送

1. 在 GitHub 新建空仓库
2. 复制仓库地址
3. 本地执行：

```bash
git remote add origin <你的仓库地址>
git branch -M main
git push -u origin main
```

### 方式二：用 GitHub CLI

如果你装了 `gh`，可以直接执行：

```bash
gh repo create <仓库名> --public --source=. --remote=origin --push
```

如果你想建私有仓库，把 `--public` 改成 `--private`。

## 当前仓库包含什么

- `skill/`：Codex 小说写作技能
- `memory-toolkit/`：长期记忆工具
- `scripts/`：安装辅助脚本

## 发布建议

如果你想让别人一眼看懂怎么用，推荐把仓库设成：

- 公开仓库：适合做作品集、开源分享、吸引同好
- 私有仓库：适合先内部试用，成熟后再公开
