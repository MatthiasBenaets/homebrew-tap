cask "aerospace-bsp" do
  version "0.0.3-bsp"
  sha256 "c83309ee3fa51f03e97e841b83545d43ec9940a85974c55c0500717014e251a3"
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
