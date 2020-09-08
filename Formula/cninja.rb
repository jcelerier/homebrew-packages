class Cninja < Formula
  desc "Opinionated CMake configuration manager"
  homepage "https://github.com/jcelerier/cninja"
  url "https://github.com/jcelerier/cninja/releases/download/v3.7.2/cninja-v3.7.2-src.tar.gz"
  sha256 "f740e5251afabe25c24b3b43045aca929813236bf97f96631b30ee884a18cf50"
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
