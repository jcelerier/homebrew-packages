class Cninja < Formula
  desc "Opinionated CMake configuration manager"
  homepage "https://github.com/jcelerier/cninja"
  url "https://github.com/jcelerier/cninja/releases/download/v3.5.2/cninja-3.5.2-src.tar.gz"
  sha256 "5b8a2b19b845ecabc7cbea2d786ca45430eabf01fb5bcfbaaa80819f0a0ce48e"
  license "AGPL-3.0-or-later"

  depends_on "boost" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cninja`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "echo 'project(foo)\nadd_executable(foo)\n' > CMakeLists.txt"
    system "echo 'int main() {}' > foo.cpp"
    system "${bin}/cninja"
  end
end
