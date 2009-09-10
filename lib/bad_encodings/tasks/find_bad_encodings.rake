# encoding: utf-8
desc "find all bad encodïngs in app"
task 'find_bad_encodings' do
  require 'find'
  raise ArgumentError, "Requires Ruby 1.9" unless RUBY_VERSION > '1.9'
  dir = File.expand_path(File.dirname(__FILE__) + '/../..')
  includes = /(\.rb|\.log|\.yml|\.rake|\.haml|\.sass)$/
  dir_excludes = /log|tmp|\.git/
  files = []
  Find.find(dir) do |path|
    if FileTest.directory?(path)
      if path =~ dir_excludes
        Find.prune       # Don't look any further into this directory.
      else
        next
      end
    elsif path =~ includes
      files << path
    end
  end
  BadEncodings.find_in_files(files)
  unless bad_lines.empty?
    puts 'The following bad encodings were found:'
    bad_lines.each do |line|
      puts "[%s:%d]" % line
    end
  else
    puts 'No bad encodings found'
  end
end
