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

