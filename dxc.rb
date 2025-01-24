class Dxc < Formula
  desc "DirectX Shader Compiler"
  homepage "https://github.com/microsoft/DirectXShaderCompiler"
  license "LLVM"
  head "https://github.com/microsoft/DirectXShaderCompiler.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "python" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-C", "cmake/caches/PredefinedParams.cmake",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}", # Ensure correct prefix
           "-GNinja"
    system "cmake", "--build", "build"
    system "cmake", "--build", "build", "--target", "install-distribution", "--", "DESTDIR=#{prefix}"
  end
end
