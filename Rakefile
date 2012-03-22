require 'rake'
require 'erb'

# Files that should not be processed should be added here
Exceptions = %w[Rakefile README README.md LICENSE vim-pre-pathogen.tar.gz write_defaults.sh]

# Global flag for replacing all files
$replace_all = ENV["DOTFILES_REPLACE"] || false

desc "Reconfigure a single file"
task :file, [:file_name,:force] do |t, args|
  file = args.file_name
  dfile = destfile(file,true)
  dfilebase = destfile(file)
  $current_file = file

  next if Exceptions.include? file
  next true if file =~ /\.private$/

  if File.exists?(dfile)
    if File.identical? file, dfile
      puts "identical #{dfilebase}" unless ENV["DOTFILES_HUSH"]
    elsif $replace_all || args.force
      replace_file(file,dfile)
    else
      print "overwrite #{dfilebase}? [yNaq] "
      case $stdin.gets.chomp
      when 'y'
        replace_file(file,dfile)
      when 'a'
        $replace_all = true
        replace_file(file,dfile)
      when 'q'
        exit
      else
        puts "skipping #{dfilebase}" unless ENV["DOTFILES_HUSH"]
      end
    end
  else
    link_file(file,dfile)
  end
end

desc "Install all dot files"
task :install do
  Dir['*'].each do |file|
    args = Rake::TaskArguments.new(%w[file_name], [file])
    Rake::Task[:file].execute(args)
  end
end

def destfile(file, fqp = false)
  return fqp \
    ? File.join(fqp ? ENV['HOME'] : "", ".#{File.basename(file).sub('.erb', '')}") \
    : ".#{File.basename(file).sub('.erb', '')}"
end

def replace_file(src,dest)
  system %Q{rm -rf "#{dest}"}
  link_file(src,dest)
end

def link_file(src,dest)
  destbase = destfile(src)
  if src =~ /\.erb$/
    puts "generating #{destbase}" unless ENV["DOTFILES_HUSH"]
    File.open(dest, 'w') do |new_file|
      new_file.write ERB.new(File.read(src)).result(binding)
    end
  else
    puts "linking #{destbase}" unless ENV["DOTFILES_HUSH"]
    system %Q{ln -s "$PWD/#{src}" "$HOME/#{destbase}"}
  end
end

def private_file(file)
  return "#{File.basename(file, File.extname(file))}.private"
end

def include_private
  return '' unless File.exists?(private_file($current_file))
  return ERB.new(IO.read(private_file($current_file))).result
end

def include_file(file)
  return '' unless File.exist?(file)
  return ERB.new(IO.read(file)).result
end

