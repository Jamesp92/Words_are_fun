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

   describe('#==') do
    it("is the same definition even if it has the same attributes as another definition ") do
      definition = Definition.new(id: nil, definition: "a tasty treat",w_id: @word.id)
      definition.save() 
      definition2 = Definition.new(id: nil, definition: "a tasty treat",w_id: @word.id)
      definition2.save() 
      expect(definition).to(eq(definition2))
    end
  end
end