cask "aerospace-bsp" do
  version "0.0.2-bsp"
  sha256 "ed88532f1eecddd0d81c7f4aebbe326f2b013a7a87c92642a833dcf337a56540"
  url "https://github.com/MatthiasBenaets/AeroSpace/releases/download/v#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace"
  desc "AeroSpace is an i3-like tiling window manager for macOS (BSP fork)"
  homepage "https://github.com/MatthiasBenaets/AeroSpace"
  depends_on macos: :ventura
  conflicts_with cask: "aerospace"
  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{staged_path}/AeroSpace-v#{version}/bin/aerospace"
    system "xattr", "-d", "com.apple.quarantine", "#{appdir}/AeroSpace.app"
  end
  app "AeroSpace-v#{version}/AeroSpace.app"
  binary "AeroSpace-v#{version}/bin/aerospace"
  uninstall quit: "bobko.aerospace"
  caveats <<~EOS
    To start AeroSpace at login:
      1. Enable "start-at-login = true" in ~/.aerospace.toml
    OR
      2. Add AeroSpace.app to Login Items in System Settings
  EOS
end
