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

 

