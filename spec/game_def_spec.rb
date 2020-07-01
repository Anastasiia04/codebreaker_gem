require 'rspec'
require 'psych'
require 'yaml'
require_relative '../game.rb'
require_relative '../validate.rb'

RSpec.describe Game do
  let(:game) { Game.new }

  it 'show hint' do
    game.choose_difficulty('easy')
    game.start
    game.show_hint
    expect(game.hints) == 1
  end

  it 'return true/false if user want/doesnt want play again' do
    expect(game.play_again?('yes')).to eq(true)
    expect(game.play_again?('no')).to eq(false)
  end

  it 'return true if user guessed' do
    game.secret_hash = { 0 => 6, 1 => 5, 2 => 4, 3 => 3 }
    game.check_attempt('6543')
    expect(game.result).to eq(true)
  end

  it 'return false if user did not guess' do
    game.secret_hash = { 0 => 6, 1 => 5, 2 => 4, 3 => 3 }
    game.choose_difficulty('hell')
    5.times { game.check_attempt('3456') }
    expect(game.result).to eq(false)
  end

  it 'check random hashes' do
    expect(game.start).not_to eq(game.start)
  end
end
