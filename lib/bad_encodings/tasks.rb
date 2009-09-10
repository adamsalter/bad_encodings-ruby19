# encoding: utf-8
require 'bad_encodings'

desc "find all bad encodïngs in app"
task 'find_bad_encodings' => :environment do
  raise ArgumentError, "Requires Ruby 1.9" unless RUBY_VERSION > '1.9'
  dir = RAILS_ROOT
  bad_lines = BadEncodings.find_in_path(dir)
  unless bad_lines.empty?
    puts 'The following bad encodings were found:'
    bad_lines.each do |line|
      puts "[%s:%d]" % [line[0].sub(dir,'RAILS_ROOT'), line[1]]
    end
  else
    puts 'No bad encodings found'
  end
end
