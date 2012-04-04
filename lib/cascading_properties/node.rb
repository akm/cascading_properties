require 'cascading_properties'

class CascadingProperties::Node < CascadingProperties::BlankSlate

  def initialize(&block)
    @_hash = {}
    instance_eval(&block) if block
  end

  def method_missing(name, *args, &block)
    name = name.to_s.sub(/\=$/, '')
    case args.length
    when 0 then
      @_hash[name] ||= CascadingProperties::Node.new(&block)
    when 1 then
      @_hash[name] = args.first
    else
      @_hash[name] = args
    end
  end

  if RUBY_PLATFORM == 'java'

  def to_properties(dest = nil, parent = nil)
      dest ||= java.util.Properties.new
    @_hash.each do |k, v|
      key = parent ? "#{parent}.#{k}" : k
      if v.respond_to?(:to_properties)
        v.to_properties(dest, key)
      else
        dest.setProperty(key, v.to_s)
      end
    end
    dest
  end

  else

    def to_properties(dest = nil, parent = nil)
      raise NotImplementedError
    end

  end

end
