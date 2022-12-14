class Word
  attr_reader :id , :word
  attr_accessor :word 
  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end
  
  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def save
    @@words[self.id] = Word.new( word: self.word, id: self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def update(word)
    self.word = word
    @@words[self.id] = Word.new(word: self.word, id: self.id)
  end

  def self.find(id)
    @@words[id]
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end