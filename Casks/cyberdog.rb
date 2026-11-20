cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.14.0"
  sha256 arm:   "be43b3c0648dc67bb2c04989cd7632e64b1369b814c7b83302f17d23efda821d",
         intel: "8ef22fea830a6c6c8fa4c0a48fd1f2d80fc494ab46461d61dd41f07145e0c1f1"

  url "https://github.com/pickywawa/cyberdog/releases/download/v#{version}/Cyberdog-#{version}-mac-#{arch}.dmg"
  name "Cyberdog"
  desc "SSH/SFTP client with a built-in terminal and server health dashboard"
  homepage "https://pickywawa.github.io/cyberdog/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Cyberdog.app"

  zap trash: [
    "~/Library/Application Support/Cyberdog",
    "~/Library/Preferences/com.pickywawa.cyberdog.plist",
    "~/Library/Saved Application State/com.pickywawa.cyberdog.savedState",
  ]
end
