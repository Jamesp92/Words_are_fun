class Definition

  attr_reader :id
  attr_accessor :definition, :w_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @w_id = attributes.fetch(w_id)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.word() == def_to_compare.word()) && (self.W_id() == def_to_compare.w_id())
  end

  def self.all
    @@definition.values
  end

  def save
    @@definition[self.id] = Definition.new(self.word, self.w_id, self.id)
  end

  def self.find(id)
    @@definition[id]
  end

  def update(word, w_id)
    self.name = word
    self.w_id = ew_id
    @@definition[self.id] = Definition.new(self.word, self.w_id, self.id)
  end

  def delete
    @@definition.delete(self.id)
  end

  def self.clear
    @@definition = {}
  end
end