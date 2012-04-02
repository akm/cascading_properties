require 'cascading_properties'

class CascadingProperties::Node < CascadingProperties::BlankSlate

  def initialize(&block)
    @_hash = {}
    instance_eval(&block) if block
  end

  def method_missing(name, *args, &block)
    name = name.to_s
    case args.length
    when 0 then
      @_hash[name] ||= CascadingProperties::Node.new(&block)
    when 1 then
      @_hash[name] = args.first
    else
      @_hash[name] = args
    end
  end

end
