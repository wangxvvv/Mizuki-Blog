# CI / CD 说明

本文档说明 **Mizuki-Blog** 项目的 CI / CD 设计思路、脚本职责划分以及环境变量约定。

该 CI 方案适用于：

- 内网服务器构建
- VPS 仅负责静态资源发布
- Linux / self-hosted runner
- 手动触发（workflow_dispatch）

---

## 一、整体流程概览

```text
GitHub 手动触发
↓
Self-hosted Runner
↓
执行 CI/build.sh
  - pnpm install
  - pnpm build
↓
执行 CI/deploy-local.sh
  - 服务器原子发布
↓
执行 CI/deploy-static-to-vps.sh
  - 同步静态资源到 VPS
```

## 二、CI目录结构说明

```text 
CI/
├── build.sh                 # 构建脚本
├── deploy-local.sh          # 内网原子发布
├── deploy-static-to-vps.sh  # VPS 静态资源同步 单机发布可以无视
└── env.example              # 环境变量示例
```

## 三、github workflows

```
name: Manual Build & Static Deploy

on:
    workflow_dispatch:
        inputs:
            note:
                description: "发布说明（可选）"
                required: false

jobs:
    deploy:
        runs-on: self-hosted

        steps:
            - name: Build
              run: path/Mizuki-Blog/CI/build.sh

            - name: Deploy local
              run: path/Mizuki-Blog/CI/deploy-local.sh

            - name: Deploy static to VPS
              run: path/Mizuki-Blog/CI/deploy-static.sh
```

