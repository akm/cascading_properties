module CascadingProperties
  autoload :BlankSlate, 'cascading_properties/blank_slate'
  autoload :Node, 'cascading_properties/node'

  class << self
    def load(dsl_text)
      node = Node.new
      node.instance_eval(dsl_text)
      node
    end

    def load_file(filepath)
      load(File.read(filepath))
    end
  end
end
