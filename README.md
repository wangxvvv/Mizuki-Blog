## Mizuki Blog

一个基于 Astro 的静态博客系统，采用 **代码 / 内容完全分离** 的架构，并通过 GitHub Actions 实现自动化 CI/CD，最终部署到自建 Ubuntu + Nginx 服务器。

### ✨ 特点

- 🔧**基于原Mizuki个人自用版**
  - 交互逻辑修改
  - 部分透明度bug
  - 部分页面修改

- 🧩 **代码 / 内容分仓**
  - 代码仓库只负责站点结构与构建逻辑
  - 内容仓库只维护文章、数据和图片
- 🔁 **CI / CD 流程（手动触发）**[**CI说明**](./CI.md) 
  - CI 以 **手动触发（workflow_dispatch）** 为主，用于在构建机或 self-hosted runner 上执行完整构建与发布流程。
- 🚀 **零停机部署**
  - 原子部署（atomic deploy）
  - 支持快速回滚
- ⚙**环境变量配置**([**环境变量说明**](/env.md))
  - 支持不同环境快速配置


### 🛠 技术栈

- Astro
- TypeScript
- pnpm
- GitHub Actions 
- Ubuntu + Nginx (self-hosted)
- Shell

### 📦 部署方式

- GitHub Actions 构建
- rsync + symlink 原子切换
- Nginx 永远指向 `/srv/mizuki/current`

### 📄 详细架构说明

详见 [**Mizuki**](./README.zh.md)

---

### 🙏 特别鸣谢

本项目主题基于 **Mizuki** 修改而来  
原始项目地址：https://github.com/matsuzaka-yuki/Mizuki/tree/master

