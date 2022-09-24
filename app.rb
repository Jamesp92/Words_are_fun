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

patch('/words/:id') do
  if params[:word] != ""
    @word = Word.find(params[:id].to_i())
    @word.update(params[:word])
  end
  @words = Word.all
  erb(:words)
end