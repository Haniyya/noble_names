# frozen_string_literal: true

require_relative '../test_helper'

require 'minitest/benchmark'

class TestString < Minitest::Benchmark
  if ENV['BENCH']
    def bench_particle_linear
      assert_performance_linear 0.99 do |n|
        ('james of windsor ' * n).to_title
      end
    end

    def bench_prefix_linear
      assert_performance_linear 0.99 do |n|
        ('james mcdormer ' * n).to_title
      end
    end
  end
end
