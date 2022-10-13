require 'rails_helper'

RSpec.describe Artist do
    it {should have_many :songs}

    describe 'instance methods' do
        describe '#average_song_length' do
            before :each do
                @prince = Artist.create!(name: 'Prince')
                @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
                @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 342, play_count: 7850)
                @song_length_test = @prince.songs.create!(title: 'Song Length Test', length: 2, play_count: 3571)
            end
            it 'returns the average song length' do
                expect(@prince.average_song_length.round(2)).to eq(396.33)
            end
        end
    end
end