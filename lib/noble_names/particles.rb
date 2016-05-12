require 'yaml'

module NobleNames
  SUPPORTED_LANGUAGES = [:german,:english,:french,:spanish,:portuguese]

  DATA_PATH = File.expand_path '../../../data/', __FILE__
  p File.expand_path('particles.yml', DATA_PATH)

  PARTICLES = YAML.load_file(File.expand_path(
                               'particles.yml', DATA_PATH
  ))['particles']
end
