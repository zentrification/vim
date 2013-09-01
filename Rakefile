def brew_install(package, *options)
  `brew list #{package}`
  return if $?.success?
  sh "brew install #{package} #{options.join ' '}"
end

def osx?
  `uname -a`.match(/Darwin/) != nil
end

def osx_dependencies
  brew_install 'ack'
end

def osx_vim_install
  sh "brew update"
  osx_dependencies
  brew_install 'vim', %w(--with-lua --override-system-vi)
end

def osx_vim_clean
  sh "brew uninstall vim"
end

namespace :vim do
  desc 'compile and install vim'
  task :install do
    osx_vim_install if osx?
  end

  desc 'recompile vim'
  task :recompile do
    osx_vim_clean if osx?
    Rake::Task['vim:install'].invoke
  end
end

namespace :tern do
  desc 'install tern (requires node)'
  task :install do
    sh "cd ~/.vim/bundle/tern_for_vim && sudo npm install"
  end
end

task :default do
  sh "rake -T"
end
