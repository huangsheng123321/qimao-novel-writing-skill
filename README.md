# qimao-novel-writing-skill

七猫/番茄网文小说写作技能包，支持 **Hermes Agent** 和 **OpenAI Codex CLI** 两种使用方式。

## 功能

- 查找/参考番茄男频最近一个月爆款小说
- 分析阅读量、完读量、完读率等热度指标可见性
- 分析整体框架、黄金三章、钩子、高潮、爽点、人设和冲突升级
- 输出 3-5 个仿写建议，并推荐一个
- 用户回复“确认”后，输出主题方案、框架方案、仿写方案
- 用户再次“确认”后，输出整本小说大纲、人物角色、细纲和正文规划
- 用户再次“确认”后，写 5 章小说内容
- 用户回复“确定”后，先审核，再修改，最后输出可直接使用的最终稿
- 七猫/番茄男频平台风格适配
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
请帮我查找番茄男频小说最近一个月的爆款小说（阅读量、完读量），分析该小说的整体框架是什么样子的，钩子是怎么设计的，高潮是怎么设计的等等。

然后给我 3-5 个仿写建议，并推荐一个，问我确认可以不。
```

确认规则：

```text
确认
```

- 第一次“确认”：进入主题方案、框架方案、仿写方案三案。
- 第二次“确认”：进入整本小说大纲、人物角色、细纲和正文规划。
- 第三次“确认”：开始写 5 章小说内容。

审核改稿触发词：

```text
确定
```

收到“确定”后，先审核，再修改，最后给可直接使用的最终稿。

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
请帮我查找番茄男频小说最近一个月的爆款小说（阅读量、完读量），分析该小说的整体框架是什么样子的，钩子是怎么设计的，高潮是怎么设计的等等。
然后给我 3-5 个仿写建议，并推荐一个，问我确认可以不。
把结果写入 output/00-爆款调研与仿写建议.md。
```

## Codex 分步提示词

### 0. 主题调研与仿写建议

```text
阅读 AGENTS.md 和 prompts/00-topic-research.md。
请帮我查找番茄男频小说最近一个月的爆款小说（阅读量、完读量），分析整体框架、钩子、高潮、爽点。
然后输出 3-5 个仿写建议，并推荐一个，问我确认可以不。
写入 output/00-爆款调研与仿写建议.md。
```

### 1. 主题 / 框架 / 仿写三案

```text
用户已回复“确认”。
请阅读 AGENTS.md 和 prompts/01-imitation-analysis.md。
基于已确认的仿写建议，输出主题方案、框架方案、仿写方案，并推荐如何组合，问用户确认可以不。
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
