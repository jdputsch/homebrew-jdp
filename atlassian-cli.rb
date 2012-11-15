require 'formula'

class AtlassianCli < Formula
  homepage 'https://developer.atlassian.com/display/DOCS/Atlassian+Plugin+SDK+Documentation'
  url 'https://bobswift.atlassian.net/wiki/download/attachments/16285777/atlassian-cli-2.6.0-distribution.zip'
  version '2.6.0'
  sha1 'ff4600b73371ccaa6964ecb47acd6641cfb6ab3c'

  def shim_script target
    <<-EOS.undent
      #!/usr/bin/env bash
      exec java -jar #{libexec}/#{target}-cli-#{version}.jar "$@"
    EOS
  end

  def install
    # install shim scripts to bin
    Dir["*.sh"].map { |p| Pathname.new p.sub('.sh','-cli') }.each { |path|
      script_name = path.basename
      bin_name = path.basename '-cli'
      (bin+script_name).write shim_script(bin_name)
    }

    # Install jars in libexec to avoid conflicts
    libexec.install Dir['lib/*']

    # Install the examples and docs
    (share+"atlassian-cli").install Dir['examples/*']
  end

  def caveats
    <<-EOS.undent
      This is the last free version of the Atlassian CLI package. For more
      information visit https://bobswift.atlassian.net/wiki/x/CgAe

      Examples and documentation have been installed in
          #{share+'atlassian-cli'}
    EOS
  end
end
