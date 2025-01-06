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
          "-GNinja"
   
   system "cmake", "--build", "build"

   cd "build/bin" do
     ["dxc", "dxa", "dxl", "dxopt", "dxr", "dxv"].each do |tool|
       real_path = File.realpath(tool)
       bin.install real_path => tool
     end
   end

   cd "build/lib" do
     lib.install "libdxcompiler.so" if OS.linux?
     lib.install "libdxcompiler.dylib" if OS.mac?
   end
 end
end
