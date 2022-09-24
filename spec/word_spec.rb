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
  describe('.clear') do 
    it("clears all words") do
      word1 = Word.new("Apple", nil)
      word1.save()
      word2 = Word.new("Kiwi", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  describe('#delete') do 
    it("deletes a word by id") do 
      word1 = Word.new("Apple", nil)
      word1.save()
      word2 = Word.new("Kiwi", nil)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
  describe('#update')do
   it("updates a word by id") do 
    word = Word.new("Apple", nil)
    word.save()
    word.update("kiwi")
    expect(word).to(eq(("kiwi")))
   end
  end

end
