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

   # Copy binaries
   cd "build/bin" do
     real_dxc = File.realpath("dxc")
     bin.install real_dxc => "dxc"
   end
 end
end
