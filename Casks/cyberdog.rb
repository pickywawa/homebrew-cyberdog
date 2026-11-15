cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.10.0"
  sha256 arm:   "f26d0ca5d6f5ad1d3047e8e15195b96eb760c33668a907bc61e4c87452f2fe45",
         intel: "46dacb5680078475ae918a356e4b38a36cda1e4b1b0cb04768b5b1f0f208f9c4"

  url "https://github.com/pickywawa/cyberdog/releases/download/v#{version}/Cyberdog-#{version}-mac-#{arch}.dmg"
  name "Cyberdog"
  desc "SSH/SFTP client with a built-in terminal and server health dashboard"
  homepage "https://pickywawa.github.io/cyberdog/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Cyberdog.app"

  # Releases are not notarized yet, so Gatekeeper would refuse the quarantined app.
  # Remove this block once the releases are signed with a Developer ID and notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cyberdog.app"]
  end

  zap trash: [
    "~/Library/Application Support/Cyberdog",
    "~/Library/Preferences/com.pickywawa.cyberdog.plist",
    "~/Library/Saved Application State/com.pickywawa.cyberdog.savedState",
  ]
end
