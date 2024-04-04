class Triton < Formula
  desc "Dynamic Binary Analysis (DBA) framework"
  homepage "https://github.com/JonathanSalwan/Triton"
  head "https://github.com/JonathanSalwan/Triton.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "capstone" => :build
  depends_on "boost" => :optional
  depends_on "python" => :optional
  depends_on "z3" => :optional
  depends_on "bitwuzla" => :optional
  depends_on "llvm" => :optional

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "-j"
      system "make", "install"
    end
  end

  test do
    # Add a simple test to verify the installation
    (testpath/"test.cpp").write <<~EOS
      #include <triton/api.hpp>
      int main() {
        triton::API api;
        return 0;
      }
    EOS

    system ENV.cxx, "test.cpp", "-I#{include}", "-L#{lib}", "-ltriton", "-o", "test"
    system "./test"
  end
end
