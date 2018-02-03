
require 'rake/testtask'

desc 'Run tests'
task default: :test
Rake::TestTask.new do |t|
  t.verbose = true
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Set the magic encoding comment everywhere to UTF-8'
task :source_encoding do
  shebang = '\s*#!.*?(\n|\r\n)'
  magic_regex = /\A(#{shebang})?\s*(#\W*(en)?coding:.*?$)/mi

  magic_comment = '#-- encoding: UTF-8'

  ([Dir.pwd] + Dir['**/**{.rb,.rake}']).each do |file_name|
    next unless File.file?(file_name)

    # We don't skip code here, as we need ALL code files to have UTF-8
    # source encoding
    file_content = File.read(file_name)
    if file_content =~ magic_regex
      file_content.gsub!(magic_regex, "\\1#{magic_comment}")
    elsif file_content.start_with?('#!')
      # We have a shebang. Encoding comment is to put on the second line
      file_content.sub!(/(\n|\r\n)/, "\\1#{magic_comment}\\1")
    else
      file_content = magic_comment + "\n" + file_content
    end

    File.open(file_name, 'w') do |file|
      file.write file_content
    end
  end
end
