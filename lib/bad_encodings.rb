class BadEncodings
  class << self
    
    def find_in_files(files)
      bad_lines = []
      files.each do |file|
        bad_lines += find_lines_in_file(file)
      end
    end
    
    def find_lines_in_file(file)
      bad_lines = []
      file_encoding = get_rb_file_encoding(file)
      file = File.open(file, "r:#{file_encoding}")
      file.each_line do |line|
        next if line.valid_encoding?
        bad_lines << [file.path, file.lineno]
      end
    end
    
    def get_rb_file_encoding(file_path)
      file = File.open(file_path, 'r:US-ASCII')
      begin
        file.each_line do |line|
          if (file.lineno == 1 || file.lineno == 2) && line =~ /^#.*coding:\s([\w-]+)/
            return $1
          elsif file.lineno > 2
            return 'US-ASCII'
          end
        end
        return 'US-ASCII'
      ensure
        file.close
      end
    end
    
  end
end