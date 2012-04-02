module CascadingProperties
  autoload :BlankSlate, 'cascading_properties/blank_slate'
  autoload :Node, 'cascading_properties/node'

  class << self
    def load(dsl_text, *args)
      node = Node.new
      node.instance_eval(dsl_text, *args)
      node
    end

    def load_file(filepath)
      erb = ERB.new(IO.read(filepath))
      erb.filename = filepath
      text = erb.result
      load(text, filepath)
    end
  end
end
