# bump-yorishiro.yml が新リリース検出時に version / sha256 を書き換える。
# sha256 の並びは on_arm → on_intel の順を前提にしているので入れ替えないこと。
#
# 注意: v0.7.0 から release 資産と app bundle は大文字始まりの
# Yorishiro_* / Yorishiro.app に変わる。この変更は v0.7.0 の公開後、
# version / sha256 の bump と同時に main へ反映すること。
cask "yorishiro" do
  version "0.6.2"

  on_arm do
    sha256 "ffeea38563f6ca04261fafdfc0c97e8ab37806307a3d5e645c088c9d91c492e1"

    url "https://github.com/sktkkoo/Yorishiro/releases/download/v#{version}/Yorishiro_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "8289b215e04ea4686fe8f7a8c95dff24284f8d0a3284fb3206b359fa7d5d8645"

    url "https://github.com/sktkkoo/Yorishiro/releases/download/v#{version}/Yorishiro_#{version}_x64.dmg"
  end

  name "Yorishiro"
  desc "Terminal that gives AI a body and a living space"
  homepage "https://yorishiro.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # v0.5.3 以降は in-app updater が自己更新するため、brew は追いかけない
  auto_updates true
  depends_on :macos

  app "Yorishiro.app"

  zap trash: [
    "~/.yorishiro",
    "~/Library/Application Support/dev.yorishiro.app",
    "~/Library/Caches/dev.yorishiro.app",
    "~/Library/Preferences/dev.yorishiro.app.plist",
    "~/Library/Saved Application State/dev.yorishiro.app.savedState",
    "~/Library/WebKit/dev.yorishiro.app",
  ]
end
