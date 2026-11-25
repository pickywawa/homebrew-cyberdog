cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.16.0"
  sha256 arm:   "1c8a72eddb5880380a6fdf4414baf35c11bb959fb24e0ee0e443532f608891b3",
         intel: "51bf53baedac6d42bff3d04beb5c3beda6360efb541b578e2cf20b1ffef6aa5d"

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
