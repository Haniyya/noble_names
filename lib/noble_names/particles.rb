require 'yaml'

module NobleNames
  SUPPORTED_LANGUAGES = [:german, :english, :french, :spanish, :portuguese].freeze

  DATA_PATH = File.expand_path '../../../data/', __FILE__

  PARTICLES = YAML.load_file(File.expand_path(
                               'particles.yml', DATA_PATH
  ))['particles']
end
