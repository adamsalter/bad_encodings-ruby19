begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = 'bad_encodings-ruby19'
    s.executables = ['find_bad_encodings']
    s.summary = 'Find bad ruby 1.9 encodings in your project.'
    s.email = 'adam@codebright.net'
    s.homepage = 'http://github.com/adamsalter/bad_encodings-ruby19'
    s.description = 'Small gem that tries to make the task of finding bad ruby encodings in your project a little easier.'
    s.authors = ['Adam Salter']
    s.files = FileList['*', '{bin,lib,test,tasks}/**/*']
    s.add_dependency 'clip', '>= 1.0'
    s.add_development_dependency 'shoulda'
  end
end
