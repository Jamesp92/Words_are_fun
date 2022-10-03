require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word then goesa to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'this is a word')
    click_on('submit new word')
    expect(page).to have_content('this is a word')
  end
end

describe('update a word path', {:type => :feature}) do
  it('updates a word and then goes to the word page') do
    word = Word.new(word: 'this is a word', id: nil)
    word.save
    visit("/word/#{word.id}")
    click_on('edit word')
    fill_in('word', :with => 'this is a definition')
    click_on('Update')
    expect(page).to have_content('this is a definition')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word and then goes to the word page') do
    Word.clear
    word = Word.new(word: 'this is a word', id: nil)
    word.save
    visit("/word/#{word.id}")
    click_on('edit word')
    click_on('Delete')
    expect(page).to have_no_content('this is a word')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    Word.clear
    word = Word.new(word: 'this is a word', id: nil)
    word.save
    visit("/word/#{word.id}")
    fill_in('word_definition', :with => 'this is a definition')
    click_on('Add definition')
    expect(page).to have_content('this is a definition')
  end
end

describe('delete a definition path', {:type => :feature}) do
  it('deletes a definition and then goes to the word page') do
    Word.clear
    Definition.clear
    word = Word.new(word: 'this is a word', id: nil)
    word.save
    definition = Definition.new(definition: 'this is a definition', id: nil, w_id: word.id)
    definition.save
    visit("/word/#{word.id}")
    click_on('this is a definition')
    click_on('Delete definition')
    expect(page).to have_no_content('this is a definition')
  end
end

describe('update a definition path', {:type => :feature}) do
  it('updates a definintion and then goes to the word page') do
    Word.clear
    Definition.clear
    word = Word.new(word: 'this is a word', id: nil)
    word.save
    definition = Definition.new(definition: 'this is a definition', id: nil, w_id: word.id)
    definition.save
    visit("/word/#{word.id}")
    click_on('this is a definition')
    fill_in('definition_edit', :with => 'this is a new definition')
    click_on('Update')
    expect(page).to have_content('this is a new definition')
  end
end
