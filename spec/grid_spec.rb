require "spec_helper"

describe "Grid" do
    HEIGHT = 500
    WIDTH = 300
    let(:test_grid) {Grid.new(HEIGHT, WIDTH)}
    let(:fake_tile) {{
        :x  => 45,
        :y  => 98,
        :id => 'tl-45-98'
    }}
    let(:test_tile_a) {Tile.new(45, 98)}
    let(:test_tile_b) {Tile.new(3, 20)}

    describe "class attributes" do
        it 'has a height and a width' do
            expect(test_grid.height).to eq(HEIGHT)
            expect(test_grid.width).to eq(WIDTH)
        end
    end

    describe 'Grid#linear_distance' do
        it 'returns a Float' do
            expect(test_grid.linear_distance(test_tile_a.id, test_tile_b.id)).to be_kind_of(Float)
        end
        it 'calculates the distance between two tiles' do
            distance = 88.5889
            expect(test_grid.linear_distance(test_tile_a.id, test_tile_b.id)).to eq(distance)
        end
    end

    describe 'Grid.find_path' do
        it 'returns an array' do
           expect(Grid.find_path(test_tile_a.id, test_tile_b.id)).to be_kind_of(Array) 
        end
        it 'first element in array should be start tile' do
            expect(Grid.find_path(test_tile_a.id, test_tile_b.id).first.id).to eq(test_tile_a.id)
        end
        it 'last element in array should be destination tile' do
            expect(Grid.find_path(test_tile_a.id, test_tile_b.id).last.id).to eq(test_tile_b.id)
        end
    end
end

describe "Tile" do
    let(:fake_tile) {{
        :x  => 45,
        :y  => 98,
        :id => 'tl-45-98'
    }}
    let(:test_tile) {Tile.new(45, 98)}

    describe "instance values" do
        it 'has an x and a y' do
            expect(test_tile.x).to eq(fake_tile[:x])
            expect(test_tile.y).to eq(fake_tile[:y])
        end

        it 'has an id' do
            expect(test_tile.id).to eq(fake_tile[:id])
        end
    end
end

