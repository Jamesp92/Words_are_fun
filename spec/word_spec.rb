require 'rspec'
require 'word'

describe '#Word' do 
  
  before(:each) do
    Word.clear()
  end
  describe('.all') do
    it("returns an empty array when there are no words") do 
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('#save') do 
    it('saves a word') do
      word1 = Word.new("Apple", nil)
      word1.save()
      word2 = Word.new("Kiwi", nil)
      word2.save()
      expect(Word.all).to(eq([word2, word1]))
    end
  end
end
