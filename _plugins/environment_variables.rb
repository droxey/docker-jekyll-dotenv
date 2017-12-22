# Plugin to add environment variables to the `site` object in Liquid templates
require 'dotenv'

module Jekyll
  class EnvironmentVariablesGenerator < Generator
    def generate(site)
      # NOTE: Assigning to ENV will not work in liquid templates
      # must iterate through the keys & values and build a new map
      site.config['env'] = Dotenv.load('.env')
    end
  end
end