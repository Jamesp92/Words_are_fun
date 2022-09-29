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
  @attributes2 = { id: nil , definition: "this is a definition.", w_id: @word.id}
  end


describe('.all') do 
  it( "returns an array with words , definition will return empty array if no definition") do
    Definition.clear
    expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new(@attributes)
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      
      definition = Definition.new(id: nil, definition: "a tasty treat", w_id: @word.id)
      definition.save
      definition2 = Definition.new(id: nil, definition: "a tasty treat", w_id: @word.id)
      definition2.save
      expect(definition).to(eq(definition2))
    end
  end

  describe('.clear') do
    it("clears all defintions") do
      definition = Definition.new(@attributes)
      definition.save()
      definition2 = Definition.new(@attributes2)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new(@attributes)
      definition.save()
      definition2 = Definition.new(@attributes2)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

end