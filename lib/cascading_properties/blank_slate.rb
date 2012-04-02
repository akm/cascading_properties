require 'cascading_properties'

class CascadingProperties::BlankSlate
  used = %w[instance_eval send class to_s hash inspect respond_to? should]
  regexp = Regexp.new("/^__|^=|^\%|", used.map{|m| "^#{m}$"}.join('|') + '/')
  instance_methods.each { |m| undef_method m unless m =~ regexp }
end
