# 项目开发注意事项


## 生成json解析

```bash
flutter packages pub run build_runner build
```

## 上线注意事项

### 1. git分支管理

![分支管理策略](./branch_manage_tactics.png)

### 2. Android上线流程

1. 打包
    叠加 `pubspec.yaml` 文件中 `version` 部分的 `versionCode` 和 `versionName` , 注意对应的服务器地址。
2. 加固
    将打好的apk包放到腾讯乐固平台加固并签名。
3. 上线
    将apk上到线上，配合测试跑完测试。
4. 提交代码
    将无bug的代码提交至master分支并打上tag
5. 保存mapping
    将mapping至buggly中