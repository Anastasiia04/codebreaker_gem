require 'rspec'
require_relative '../game.rb'
require_relative '../validate.rb'

describe Game do
  let(:game) { Game.new }

  it 'shoud have false if user_name invalid' do
    string = 'nn'
    expect(game.validate_name(string)).to eq(false)
    string = 'nnnnnnnnnnnnnnnnnnnnnnn'
    expect(game.validate_name(string)).to eq(false)
    string = 'nnnn'
    expect(game.validate_name(string)).to eq(true)
  end

  it 'shoud have false if user attempt invalid' do
    string = 'nn'
    expect(game.validate_attempt(string)).to eq(false)
    string = '7897'
    expect(game.validate_attempt(string)).to eq(false)
    string = '1111'
    expect(game.validate_attempt(string)).to eq(true)
    string = '1234'
    expect(game.validate_attempt(string)).to eq(true)
  end
end
