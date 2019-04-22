class Pokerstove < Formula
    desc "Poker Evaluation and Enumeration Software"
    homepage "https://github.com/andrewprock/pokerstove"
    # the latest pokerstove release is 2 years old. this url is the latest one.
    url "https://github.com/CircleOnCircles/pokerstove/archive/v0.1.1.tar.gz"
    sha256 "2c7619d93926f88a78bdd89833657de1ced2195eb5db8845888105424e8800cb"
    # url "https://github.com/andrewprock/pokerstove/archive/v0.1.tar.gz"
    # sha256 "c61959e6c7cd0ba62f09d3bee39e877b65b868c18939f384881546ea4d2a19ce"
    head "https://github.com/andrewprock/pokerstove.git"
  
    depends_on "cmake" => :build
    depends_on "boost"
  
    def install
      mkdir "build" do
        system "cmake", "-DCMAKE_BUILD_TYPE=Release", ".."
        system "make"
        bin.install "bin/ps-eval"
        bin.install "bin/ps-colex"
        bin.install "bin/peval_tests"
      end
    end
  
    def caveats; <<~EOS
      To run:
            ps-eval acas
            ps-eval AcAs Kh4d --board 5c8s9h
            ps-eval --game l 7c5c4c3c2c
        for more info, visit https://github.com/andrewprock/pokerstove
    EOS
    end
  
    test do
      system bin/"peval_tests"
    end
  end
  