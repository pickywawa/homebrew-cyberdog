cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.10.1"
  sha256 arm:   "dab4139dde9ae83a9d2e7d38858305896bdd99a2cca70462ea34daad0c449250",
         intel: "3df83efc51763c2f03b4fdee1f28d2ee6ae55dea546caee829d5c3dca21bc689"

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
