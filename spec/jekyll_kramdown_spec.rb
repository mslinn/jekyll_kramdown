require 'rspec/expectations'
require 'rspec/match_ignoring_whitespace'

require_relative 'spec_helper'
require_relative '../lib/jekyll_kramdown'

class JekyllKramdownTest
  RSpec.describe JekyllKramdown do
    it 'tests does something' do
      actual = 1
      expected = 1
      expect(actual).to eq(expected)
    end
  end
end
