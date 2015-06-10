module Utils
  class << self
    def assets_dir(dir="")
      dir.end_with? '/' ? dir : "#{dir}/"
    end
  end
end
