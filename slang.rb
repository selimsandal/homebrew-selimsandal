class Slang < Formula
  desc "Shader compiler and library"
  homepage "https://github.com/shader-slang/slang"
  url "https://github.com/shader-slang/slang.git",
      tag:      "v2024.17",
      revision: "772c48af91951bda9ff7064fc7a089550c759f76"
  license "MIT"
  head "https://github.com/shader-slang/slang.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", 
           "-G", "Ninja",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DHOMEBREW_ALLOW_FETCHCONTENT=ON",
           *std_cmake_args
    
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # Add a basic test - for example, checking if the slangc executable works
    system "#{bin}/slangc", "--version"
  end
end
