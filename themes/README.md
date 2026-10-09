# 小智 AI 主题市场

本目录与项目源码一起发布，不需要单独创建主题仓库。

- 市场索引：`themes/index.json`。
- 主题配置：`themes/<主题 ID>/theme.json`。
- 默认提供自有的“小智 AI · 智蓝”主题，不复制第三方主题背景图片。
- ID 不含路径分隔符；索引中的 `theme_url` 使用本仓库 `main` 分支的 HTTPS 原始文件地址。
- 修改主题文件后，更新索引中的 `theme_sha256`；该字段为最终文件字节的 SHA-256。
- 上传后检查原始文件地址可访问，再在程序中刷新主题市场；应用主题后重启 Codex。

## 应用身份

- Tauri 管理程序：`cn.xiaozhiagent.xiaozhiai.manager`。
- macOS 主应用：`cn.xiaozhiagent.xiaozhiai`。
- 应用标识与 GitHub 仓库名相互独立，修改标识无需先创建 GitHub 仓库。
- 更换标识会影响系统对应用身份、权限和 WebView 状态的识别；旧安装建议卸载后重新安装，并重新授予 macOS 所需权限。
- 本次保留 `.codexx`、`.codexx-cli` 和 Codex 数据目录，避免主动迁移或清空已有配置。
