require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  @words = Word.all
  erb(:words)
end

get('/words/new') do
erb(:new_word)
end

post('/words') do
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

# patch('/words/:id') do
#   if params[:word] !=""
#     @word = Word.find(params[:id].to_i())
#     @word.update(params[:name])
#   end
#   @album = Word.all
#   erb(:words)
# end