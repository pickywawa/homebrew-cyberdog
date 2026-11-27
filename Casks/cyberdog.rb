cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0"
  sha256 arm:   "fc4e1289d378b4f29a95e0905531c4e42f41177809fa90a626b64e060cf1cfdb",
         intel: "52064ad8e669771fc864384807d08b9a687e48b1edb4da1daefc02c4f28a8112"

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
