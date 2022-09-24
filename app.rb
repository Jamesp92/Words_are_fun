require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  words = Word.all
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