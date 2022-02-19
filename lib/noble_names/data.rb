# frozen_string_literal: true

module NobleNames
  # The module responsible for maintaining and delivering
  # the match data as defined in the `data` directory.
  module Data
    DATA_PATH = File.expand_path('../../data', __dir__).freeze

    @nobility_particles = MatchIndex.new('nobility_particles.yml')
    @nobility_prefixes  = MatchIndex.new('nobility_prefixes.yml')
    @business_particles = MatchIndex.new('business_particles.yml')

    # This returns an instance variable if it exists.
    # Otherwise it calls super.
    def self.method_missing(method, *args, &block)
      var = instance_variable_get("@#{method}")
      var || super
    end

    # Remember to define respond_to_missing.
    def self.respond_to_missing?(method, *args, &block)
      var = instance_variable_get("@#{method}")
      var ? true : super
    end
  end
end
