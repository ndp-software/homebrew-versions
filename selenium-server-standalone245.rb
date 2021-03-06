class SeleniumServerStandalone245 < Formula
  desc "Automated Browser Control"
  homepage "http://seleniumhq.org/"
  url "http://selenium-release.storage.googleapis.com/2.45/selenium-server-standalone-2.45.0.jar"
  sha256 "1172dfa2d94b43bcbcd9e85c824fd714f2d1ed411b6919a22e7338879fad757b"

  conflicts_with "selenium-server-standalone", :because => "Differing version of core formula"

  def install
    libexec.install "selenium-server-standalone-2.45.0.jar"
    bin.write_jar_script libexec/"selenium-server-standalone-2.45.0.jar", "selenium-server"
  end

  plist_options :manual => "selenium-server -p 4444"

  test do
    # This package provides a script that doesn't have good testing options beyond running selenium.
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/java</string>
        <string>-jar</string>
        <string>#{libexec}/selenium-server-standalone-2.45.0.jar</string>
        <string>-port</string>
        <string>4444</string>
      </array>
      <key>ServiceDescription</key>
      <string>Selenium Server</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/selenium-error.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/selenium-output.log</string>
    </dict>
    </plist>
  EOS
  end
end
