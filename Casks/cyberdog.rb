cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.15.0"
  sha256 arm:   "2416dc09b702fc2893b79e93242cc3ca8f757c9c2b8055e1296908bd4de56684",
         intel: "720ec84c2ab71ceda7789f60961bd0b4b0a936f3d740ada1aaddf00db50ab053"

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
