class Definition

  attr_reader :id
  attr_accessor :definition, :w_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @w_id = attributes.fetch(:w_id)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  
  def self.all
    @@definition.values
  end

  def ==(def_to_compare)
    self.definition() == def_to_compare.definition()
  end


  # def save
  #   @@definition[self.id] = Definition.new(self.word, self.w_id, self.id)
  # end

  # def self.find(id)
  #   @@definition[id]
  # end

  # def update(word, w_id)
  #   self.name = word
  #   self.w_id = ew_id
  #   @@definition[self.id] = Definition.new(self.word, self.w_id, self.id)
  # end

  # def delete
  #   @@definition.delete(self.id)
  # end

  def self.clear
    @@definition = {}
  end
end