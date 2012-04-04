require 'java'
require 'cascading_properties'

java.util.Properties.instance_eval do
  def load_dsl(dsl_text)
    node = CascadingProperties.load(dsl_text)
    node.to_properties
  end
end
