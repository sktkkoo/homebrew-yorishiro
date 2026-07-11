# homebrew-yorishiro

[Yorishiro](https://yorishiro.dev) の Homebrew tap。

## Install

```sh
brew install --cask sktkkoo/yorishiro/yorishiro
```

インストール後の更新は Yorishiro 自身の in-app updater が行います（cask は `auto_updates true`）。

## How it works

- `Casks/yorishiro.rb` — Yorishiro の cask（Apple Silicon / Intel 両対応）
- `.github/workflows/bump-yorishiro.yml` — 新リリースを定期検出して cask を自動更新
