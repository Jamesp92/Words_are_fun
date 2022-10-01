class Definition

  attr_reader :id , :definition
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

  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.w_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end  
end