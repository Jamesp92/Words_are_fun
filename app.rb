require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  @words = Word.all
  erb(:words)
end

get('/words/new') do
erb(:new_word)
end

get('/words') do
  @word = Word.find(params[:id].to_i())
  user_word = params[:word]
  @word = Word.new(word: user_word , id: nil)
  @words = Word.all()
  erb(:words)
end

post('/words') do
  @word = Word.find(params[:id].to_i())
  user_word = params[:word]
  word = Word.new(word: user_word , id: nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:word])
  @words = Word.all
  erb(:words)
end

delete('/word/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete()
  @word = Word.all
  erb(:words)
end


post('/word/:id/definition') do 
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(definition: params[:word_definition], id: nil , w_id: @word.id)
  definition.save
  erb(:word)
end

get('/word/:id/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.new(definition: params[:word_definition], id: nil , w_id: @word.id)
  erb(:edit_definition)
end

patch('/word/:id/definition/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:id].to_i)
  @definition.delete()
  @definition = Definition.new(definition: params[:definition_edit], id: nil , w_id: @word.id)
  @definition.update(params[:definition_edit])
  erb(:word)
end

get('/edit_word') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end


# patch('/word/:id/definition/:definition_id') do
#   @word = Word.find(params[:id].to_i())
#   if params[:word_definition] != ""
#     definition = Definition.find(params[:definition_id].to_i())
#     definition.update(params[:definition_edit], @word.id)
#   end
#   erb(:word)
# end



