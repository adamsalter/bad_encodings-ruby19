require 'find'

class BadEncodings
  class << self
    def find_lines_in_path(dir, includes = nil, dir_excludes = nil)
      includes ||= /(\.rb|\.rake|\.haml|\.sass|\.erb)$/
      files = []
      Find.find(dir) do |path|
        if FileTest.directory?(path)
          if !dir_excludes.nil? && path =~ dir_excludes
            Find.prune       # Don't look any further into this directory.
          else
            next
          end
        elsif path =~ includes
          files << path
        end
      end
      find_lines_in_files(files)
    end
    
    def find_lines_in_files(files)
      bad_lines = []
      files.each do |file|
        bad_lines += find_lines_in_file(file)
      end
      bad_lines
    end
    
    def find_lines_in_file(file)
      bad_lines = []
      file_encoding = get_rb_file_encoding(file)
      file = File.open(file, "r:#{file_encoding}")
      file.each_line do |line|
        next if line.valid_encoding?
        bad_lines << [file.path, file.lineno]
      end
      bad_lines
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
      rescue ArgumentError
        # rescue invalid byte sequence on first line of file
        return 'US-ASCII'
      ensure
        file.close
      end
    end
    
  end
end