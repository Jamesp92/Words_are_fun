require 'rspec'
require 'definition'
require 'word'


describe '#Definition' do 

  before(:each) do
  Definition.clear
  Word.clear
  @word = Word.new(word: "apple", id: nil)
  @word.save

  @attributes = { id: nil , definition: "a tasty treat.", w_id: @word.id}
  end


describe('.all') do 
  it( "returns an array with words , definition will return empty array if no definition") do
    expect(Definition.all).to(eq([]))
    end
  end
end
