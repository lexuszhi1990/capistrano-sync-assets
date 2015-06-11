module Utils
  class << self
    def assets_dir(dir="")
      # TODO: dir[0, dir.length-1] or dir.split('/').join("/")
      dir.end_with? '/' ? dir.split('/').join("/") : dir
    end

    def yes_or_no?(msg, prompt = "(y)es, (n)o ")
      ask(:answer, "#{msg} #{prompt} ? ")
      (fetch(:answer) =~ /^y$|^yes$/i) == 0
    end
  end
end
