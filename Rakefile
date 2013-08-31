def is_osx
  `uname -a`.match(/Darwin/) != nil
end

def osx_vim_install
  sh "brew update"
  sh "brew install vim --with-lua --override-system-vi"
end

def osx_vim_clean
  sh "brew uninstall vim"
end

namespace :vim do
  desc 'compile and install vim'
  task :install do
    osx_vim_install if is_osx
  end

  desc 'recompile vim'
  task :recompile do
    osx_vim_clean if is_osx
    Rake::Task['vim:install'].invoke
  end
end

task :default do
  sh "rake -T"
end
