require 'formula'

class LmutilJdp < Formula
  homepage 'http://www.globes.com/support/fnp_utilities_download.htm'
  url 'http://www.globes.com/products/utilities/v11.11.1.1/lmutil-universal_mac10-11.11.1.1.tar.gz'
  version '11.11.1.1'
  sha1 '460f43598251c3674bdfce60a04224a4b3d0e435'

  def install
    bin.install 'lmutil'
    chmod 0755, bin+'lmutil'
    ln_s bin+'lmutil', bin+'lmstat'
    ln_s bin+'lmutil', bin+'lmdiag'
  end
end
