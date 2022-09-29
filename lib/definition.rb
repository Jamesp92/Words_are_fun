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
    @@definitions.values()
  end

  def save
    @@definitions[self.id] = Definition.new(definition: self.definition, id: self.id, w_id: self.w_id)
  end

  def == (def_to_compare)
    self.definition() == def_to_compare.definition()
  end

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(updated_definition)
    self.definition = updated_definition
    @@definitions[self.id] = Definition.new(definition: self.definition, id: self.id, w_id: self.w_id)
  end

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

end