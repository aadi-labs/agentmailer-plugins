# frozen_string_literal: true

# Custom gemspec configuration file
# This file is automatically loaded by the main gemspec file. The 'spec' variable is available
# in this context from the main gemspec file. You can modify this file to add custom metadata,
# dependencies, or other gemspec configurations. If you do make changes to this file, you will
# need to add it to the .fernignore file to prevent your changes from being overwritten.

def add_custom_gemspec_data(spec)
  spec.name = "agentmailer"
  spec.authors = ["Aadi Labs"]
  spec.email = ["support@agentmailer.ai"]
  spec.homepage = "https://agentmailer.ai"
  spec.metadata["source_code_uri"] = "https://github.com/aadi-labs/agentmailer-plugins/tree/main/sdk/ruby"
  spec.license = "MIT"
end
