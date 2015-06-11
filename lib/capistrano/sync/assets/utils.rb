module Utils
  class << self
    def assets_dir(dir="")
      # Benchmark.ips do |x|
      #   x.report("dir[0, dir.length-1]") do
      #     string = "/Users/david/bs_repos/tmp_repo/eio/"
      #     string[0, string.length-1]
      #   end
      #
      #   x.report("split('/').join") do
      #     "/Users/david/bs_repos/tmp_repo/eio/".split('/').join("/")
      #   end
      #
      #   x.compare!
      # end
      #
      # Comparison:
      # dir[0, dir.length-1]:  1844071.9 i/s
      # split('/').join:   406966.0 i/s - 4.53x slower

      dir.end_with? '/' ? dir[0, dir.length-1] : dir
    end

    def yes_or_no?(msg, prompt = "(y)es, (n)o ")
      ask(:answer, "#{msg} #{prompt} ? ")
      (fetch(:answer) =~ /^y$|^yes$/i) == 0
    end
  end
end
