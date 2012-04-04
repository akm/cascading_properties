require 'java'
require 'cascading_properties'

java.util.Properties.instance_eval do
  def load_dsl(dsl_text)
    CascadingProperties.load(dsl_text)
  end
end
