# bump-yorishiro.yml が新リリース検出時に version / sha256 を書き換える。
# sha256 の並びは on_arm → on_intel の順を前提にしているので入れ替えないこと。
#
# 注意: v0.7.0 から release 資産と app bundle は大文字始まりの
# Yorishiro_* / Yorishiro.app に変わる。この変更は v0.7.0 の公開後、
# version / sha256 の bump と同時に main へ反映すること。
cask "yorishiro" do
  version "0.7.0"

  on_arm do
    sha256 "1aa9755cde1438d61fd022db9e320f7c649f2bd195fd4bd46da926dea46087b7"

    url "https://github.com/sktkkoo/Yorishiro/releases/download/v#{version}/Yorishiro_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "3f390f2bc3811dfd2c315de01bcff09f356ce51c6a06b81fd87b4cb775c2c5ba"

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
