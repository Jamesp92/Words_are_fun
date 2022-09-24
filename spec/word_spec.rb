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
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
     it("is the same word even if it has the same attributes as another word") do 
      word = Word.new("Apples", nil)
      word2 = Word.new("Apples", nil)
      expect(word).to(eq(word2))
    end
  end
end
