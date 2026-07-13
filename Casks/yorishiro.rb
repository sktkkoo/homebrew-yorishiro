# bump-yorishiro.yml が新リリース検出時に version / sha256 を書き換える。
# sha256 の並びは on_arm → on_intel の順を前提にしているので入れ替えないこと。
#
# 注意: yorishiro_* 名の release 資産を持つのは v0.6.0 以降なので、
# この cask が実際に機能するのも v0.6.0 以降。
# 下の sha256 は placeholder で、次回の bump で正しい値に置き換わる。
cask "yorishiro" do
  version "0.6.0"

  on_arm do
    sha256 "5068d01c6c89479d380a37ac1ed425f2b006cdd8f00bdc1a550fdd52a272e9bd"

    url "https://github.com/sktkkoo/Yorishiro/releases/download/v#{version}/yorishiro_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "b65746cafa4d2f46594a014073b8cfa4253ca1a46293f156642f74fa64a6e877"

    url "https://github.com/sktkkoo/Yorishiro/releases/download/v#{version}/yorishiro_#{version}_x64.dmg"
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

  app "yorishiro.app"

  zap trash: [
    "~/.yorishiro",
    "~/Library/Application Support/dev.yorishiro.app",
    "~/Library/Caches/dev.yorishiro.app",
    "~/Library/Preferences/dev.yorishiro.app.plist",
    "~/Library/Saved Application State/dev.yorishiro.app.savedState",
    "~/Library/WebKit/dev.yorishiro.app",
  ]
end
