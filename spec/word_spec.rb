require 'rspec'
require 'word'

describe '#Word' do 
  
  before(:each) do
    Word.clear()

    @attributes = { word: "apples", id: nil}

    @attributes2 = { word: "kiwi", id: nil}

    @word = Word.new(@attributes)
    @word.save

    @word2 = Word.new(@attributes2)
    @word2.save
  end
end
  describe('.all') do
    it("returns an empty array when there are no words") do 
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('#save') do 
    it('saves a word') do
      word1 = Word.new(word: "apple" , id: nil)
      word1.save()
      word2 = Word.new(word: "kiwi" , id: nil)
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
     it("is the same word even if it has the same attributes as another word") do 
      word = Word.new(word: "apple" , id: nil)
      word2 = Word.new(word: "apple" , id: nil)
      expect(word).to(eq(word2))
    end
  end
  describe('.clear') do 
    it("clears all words") do
      word1 = Word.new(word: "apple" , id: nil)
      word1.save()
      word2 = Word.new(word: "kiwi" , id: nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  describe('#delete') do 
    it("deletes a word by id") do 
      word1 = Word.new(word: "apple" , id: nil)
      word1.save()
      word2 = Word.new(word: "kiwi" , id: nil)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
  describe('#update')do
   it("updates a word by id") do 
    word1 = Word.new(word: "apple" , id: nil)
    word1.update("kiwi")
    expect(word1.word).to(eq(("kiwi")))
   end
  end
