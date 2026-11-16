cask "cyberdog" do
  arch arm: "arm64", intel: "x64"

  version "1.11.0"
  sha256 arm:   "851116b28a0391a4ac4707841105f36b51e80fe82bde4c051e2f9eb6134fceb9",
         intel: "67664ca352cafc1fb58a8456e4f024e46f50b83ecce368a486f894e5c60d1cbd"

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
