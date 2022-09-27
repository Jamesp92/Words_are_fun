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

  