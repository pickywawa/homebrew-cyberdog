cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.12.0"
  sha256 arm:   "d0fc752c2f06a10806d5e133dcf234430c81a5a30cbc2bb901e2e1f69c6178a8",
         intel: "86ef8e53ab323fab5fd696cedd75da4f6c3c660e153c5ca8aecd2042d3d8fc73"

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
