require File.dirname(__FILE__) + '/test_helper'

class BadEncodingsTest < Test::Unit::TestCase
  context 'A file with bad encodings' do
    should 'fail' do
      bad_file = File.dirname(__FILE__) + '/bad_encodings/bad1.rb'
      bad_lines = BadEncodings.find_lines_in_file(bad_file)
      assert_equal bad_lines.class, Array
      assert_equal bad_lines[0][1], 4
    end
  end

  context 'A path with bad encodings' do
    should 'fail' do
      bad_lines = BadEncodings.find_lines_in_path(File.dirname(__FILE__))
      assert_equal bad_lines.class, Array
      assert_equal bad_lines[0][1], 1
      assert_equal bad_lines[1][1], 3
      assert_equal bad_lines[2][1], 4
    end
  end
end