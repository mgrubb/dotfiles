require 'rake'
require 'erb'

desc "Install the dotfiles into user's home directory"
task :install do
	replace_all = false
	Dir['*'].each do |file|
		next if %w[Rakefile README README.md LICENSE vim-pre-pathogen.tar.gz].include? file
		next if file =~ /.private$/
		$current_file = file

		if File.exists?(destfile(file,true))
			if File.identical? file, destfile(file,true)
				puts "identical #{destfile(file)}"
			elsif replace_all
				replace_file(file)
			else
				print "overwrite #{destfile(file)}? [ynaq] "
				case $stdin.gets.chomp
				when 'a'
					replace_all = true
					replace_file(file)
				when 'y'
					replace_file(file)
				when 'q'
					exit
				else
					puts "skipping #{destfile(file)}"
				end
			end
		else
			link_file(file)
		end
	end
end

def destfile(file,show_base = false)
	return show_base \
		? File.join((show_base ? ENV['HOME'] : ''), ".#{file.sub('.erb', '')}") \
		: ".#{file.sub('.erb', '')}"
end

def replace_file(file)
	system %Q{rm -rf "#{destfile(file, true)}"}
	link_file(file)
end

def link_file(file)
	if file =~ /.erb$/
		puts "generating #{destfile(file)}"
		File.open(destfile(file, true), 'w') do |new_file|
			new_file.write ERB.new(File.read(file)).result(binding)
		end
	else
		puts "linking #{destfile(file)}"
		system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
	end
end

def private_file(file)
	return "#{File.basename(file, File.extname(file))}.private"
end

def include_private
	return '' unless File.exist?(private_file($current_file))
	return ERB.new(IO.read(private_file($current_file))).result
end

def include_file(file)
	return '' unless File.exist?(file)
	return ERB.new(IO.read(file)).result
end
