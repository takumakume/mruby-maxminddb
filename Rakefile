MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || ".travis_build_config.rb")
MRUBY_VERSION=ENV["MRUBY_VERSION"] || "master"

file :mruby do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git"
  Dir.chdir("./mruby") do
    sh "git checkout #{MRUBY_VERSION} || true"
  end
end

desc "compile binary"
task :compile => :mruby do
  sh "cd mruby && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all"
end

desc "test"
task :test => :compile do
  sh "cd mruby && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all test"
end

desc "cleanup"
task :clean do
  sh "cd mruby && rake deep_clean"
end
