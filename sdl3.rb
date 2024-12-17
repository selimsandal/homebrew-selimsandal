class Sdl3 < Formula
  desc "Low-level access to audio, keyboard, mouse, joystick, and graphics"
  homepage "https://www.libsdl.org/"
  version "3.0.0-dev"  # Added version
  url "https://github.com/libsdl-org/SDL.git",
      revision: "080b3002c69f888d83f5de25be876ec4a672ed43"
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
