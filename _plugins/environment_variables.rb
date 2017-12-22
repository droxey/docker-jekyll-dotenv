# Plugin to add environment variables to the `site` object in Liquid templates
require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    priority :highest

    def generate(site)
      site.config['env'] = ENV['JEKYLL_ENV'] || 'development'
      # Add other environment variables to `site.config` here...
      Jekyll.logger.debug site.config.to_yaml
    end
  end
end