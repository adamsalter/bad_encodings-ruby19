# encoding: utf-8
desc "find all bad encodïngs in app"
task 'find_bad_encodings' do
  require 'find'
  raise ArgumentError, "Requires Ruby 1.9" unless RUBY_VERSION > '1.9'
  dir = File.expand_path(File.dirname(__FILE__) + '/../..')
  bad_lines = BadEncodings.find_in_path(dir)
  unless bad_lines.empty?
    puts 'The following bad encodings were found:'
    bad_lines.each do |line|
      puts "[%s:%d]" % line
    end
  else
    puts 'No bad encodings found'
  end

end
