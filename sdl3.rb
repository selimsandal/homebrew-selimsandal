class Sdl3 < Formula
  desc "Low-level access to audio, keyboard, mouse, joystick, and graphics"
  homepage "https://www.libsdl.org/"
  license "Zlib"
  head "https://github.com/libsdl-org/SDL.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           *std_cmake_args
    
    system "cmake", "--build", "build", "--config", "Release", "--parallel"
    system "cmake", "--install", "build", "--config", "Release"
  end
end
