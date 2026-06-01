# qimao-novel-writing-skill

七猫/番茄网文小说写作技能包，支持 **Hermes Agent** 和 **OpenAI Codex CLI** 两种使用方式。

## 功能

- 主题调研
- 查找/参考同题材高热小说或爆款案例
- 爆款共性分析
- 3-5 个仿写建议
- 主题方案
- 框架方案
- 仿写方案
- 整本小说大纲
- 人物角色
- 章节细纲
- 正文写作
- 五章一审
- 审核后修改终稿
- 七猫/番茄平台风格适配
- 黄金三章、爽点、钩子、去 AI 味

## 目录结构

```text
qimao-novel-writing-skill/
├── qimao-novel-writing/          # Hermes Skill 完整技能包
│   ├── SKILL.md
│   ├── references/
│   └── templates/
├── codex/                        # Codex 项目模板
│   ├── AGENTS.md
│   ├── prompts/                       # 含主题调研、仿写拆解、大纲、人物、细纲、正文、审核
│   ├── references/
│   ├── templates/
│   ├── input/
│   └── output/
├── install.sh                    # 安装 Hermes Skill
├── update.sh                     # 更新 Hermes Skill
├── README.md
├── CHANGELOG.md
└── LICENSE
```

## 方式一：安装到 Hermes Agent

```bash
git clone https://github.com/YOUR_NAME/qimao-novel-writing-skill.git
cd qimao-novel-writing-skill
bash install.sh
```

然后重启 Hermes，或在会话里执行：

```text
/reload-skills
```

使用：

```text
/skill qimao-novel-writing
```

推荐提示词：

```text
我要写七猫小说，按 qimao-novel-writing 流程来。
我先给你一个主题，你先帮我找/参考相关高热小说或爆款案例，分析为什么阅读量高。
分析完成后，给我 3-5 个仿写建议，并推荐一个。
我确认某个仿写建议后，你再给我主题方案、框架方案、仿写方案三个内容，并建议使用哪一个。
我再次确认后，你再开始写整本小说大纲、人物角色、细纲和正文。
每写 5 章后，你要审核，然后给我修改后的最终稿。
```

## 方式二：在 Codex CLI 中使用

Codex 更适合用项目模板方式，而不是直接安装 Hermes Skill。

```bash
git clone https://github.com/YOUR_NAME/qimao-novel-writing-skill.git
cp -r qimao-novel-writing-skill/codex my-novel-project
cd my-novel-project
git init
codex
```

然后在 Codex 中输入：

```text
阅读 AGENTS.md。
我要写一本七猫小说。
我的主题是：【在这里写主题】。
请先找/参考相关高热小说或爆款案例，分析为什么阅读量高。
然后给我 3-5 个仿写建议，并推荐一个。
不要写正文，先等我确认方向。
把结果写入 output/00-主题调研与仿写建议.md。
```

## Codex 分步提示词

### 0. 主题调研与仿写建议

```text
阅读 AGENTS.md 和 prompts/00-topic-research.md。
我的主题是：【在这里写主题】。
请找/参考相关高热小说或爆款案例，分析阅读量/热度高的原因。
然后输出 3-5 个仿写建议，并推荐一个。
写入 output/00-主题调研与仿写建议.md。
```

### 1. 主题 / 框架 / 仿写三案

```text
我确认采用方案 X。
请阅读 AGENTS.md 和 prompts/01-imitation-analysis.md。
基于我确认的仿写建议，输出主题方案、框架方案、仿写方案，并推荐如何组合。
写入 output/01-主题框架仿写三案.md。
```

### 2. 整本大纲

```text
我确认采用你推荐的组合方案。
请根据 AGENTS.md、output/00-主题调研与仿写建议.md、output/01-主题框架仿写三案.md 和 templates/outline-template.md，生成整本小说大纲。
写入 output/02-整本大纲.md。
```

### 3. 人物角色

```text
继续生成 6-8 个主要人物角色，写入 output/03-人物角色.md。
```

### 4. 第一卷细纲

```text
继续生成第一卷 30 章细纲，写入 output/04-第一卷细纲.md。
```

### 5. 第 1-5 章正文、审核、终稿

```text
根据大纲、人物和细纲，写第 1-5 章初稿，写入 output/05-第1-5章初稿.md。
写完后立刻审核，并把审核报告写入 output/06-第1-5章审核.md。
最后根据审核输出修改后的最终稿，写入 output/07-第1-5章最终稿.md。
```

## 更新

```bash
cd qimao-novel-writing-skill
git pull
bash update.sh
```

## 注意

- 仿写不是抄袭，只能借节奏、爽点、钩子方式。
- 必须更换人物、设定、冲突和表达。
- 每章结尾必须有钩子。
- 正文按 5 章一组推进：写作 → 审核 → 修改终稿。

## License

MIT
