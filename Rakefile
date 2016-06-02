require 'rake/testtask'

desc 'Run tests'
task default: :test
Rake::TestTask.new do |t|
  t.verbose = true
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end
