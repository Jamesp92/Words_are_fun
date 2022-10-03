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
