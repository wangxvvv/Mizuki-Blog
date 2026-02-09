###  1.启用内容分离

- 先用模板创建一份环境变量

``` shell
cp .env.example .env
```

- 编辑.env

``` env
ENABLE_CONTENT_SYNC=true
CONTENT_REPO_URL=远程仓库的URL
```



### 2.根据需要修改路径变量（CI路径中的脚本读取）

```env
# ===== 本地 CI 相关 =====

# CI 脚本所在根目录（比如 /opt/blog）
CI_ROOT=

# 博客源码仓库绝对路径
# 例如：/opt/blog/Mizuki-Blog
REPO_DIR=
DIST_DIR=

# ===== 本地发布（内网服务）=====

# 本地服务部署根目录（用于软链接 current）
# 例如：/srv/mizuki
LOCAL_APP_ROOT=

# 本地保留多少个历史版本（用于回滚）
# 例如：5
LOCAL_RELEASE_KEEP=

# ===== VPS 静态资源发布 =====

# VPS 登录用户名
# 例如：root 或 ubuntu
VPS_USER=

# VPS 服务器 IP 或域名
# 例如：1.2.3.4 或 yourdomain.com
VPS_HOST=

# VPS 上静态资源部署根目录
# 例如：/srv/mizuki/static
VPS_STATIC_ROOT=

# VPS 保留多少个历史版本
VPS_RELEASE_KEEP=

# ===== 通用 =====
TIME_FORMAT=%Y%m%d_%H%M%S
```

