#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

%w[rubygems looksee].each do |gem|
  begin
	require gem
  rescue LoadError
	puts "Error Loading: #{gem}"
  end
end

class Object
	def local_methods(obj=self)
		(obj.methods - obj.class.superclass.instance_methods).sort
	end

	def ri(method=nil)
		unless method && method =~ /^[A-Z]/ # if class isn't specified
			klass = self.kind_of?(Class) ? name : self.class.name
			method = [klass, method].compact.join('#')
		end
		system 'ri', method.to_s
	end
end

def copy(str)
	IO.popen('pbcopy', 'w') {|f| f << str.to_s}
end

def copy_history
	history = Readline::HISTORY.entries
	index = history.rindex("exit") || -1
	content = history[(index + 1)..-2].join("\n")
	puts content
	copy content
end

def paste
	`pbpaste`
end
