require 'cascading_properties'

class CascadingProperties::Node < CascadingProperties::BlankSlate

  def initialize
    @_hash = {}
  end

  def method_missing(name, *args, &block)
    name = name.to_s
    case args.length
    when 0 then
      if block
        node = CascadingProperties::Node.new
        node.instance_eval(&block)
        @_hash[name] = node
        node
      else
        @_hash[name] ||= CascadingProperties::Node.new
      end
    when 1 then
      @_hash[name] = args.first
    else
      @_hash[name] = args
    end
  end

end
