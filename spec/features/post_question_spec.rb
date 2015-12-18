require 'rails_helper'
require 'launchy'

feature 'post a question' do
  scenario 'create a new question if title, description are filled in ' do
    visit new_question_path
    fill_in "Title", with: "I am having a hard time coming up with ideas for my breakable toy. Can someone help me? "
    fill_in "Description", with: "Breakable toy is weighing heavy on my mind and I cannot fall asleep. My life is miserable. I will only be able to find a peace of mind if I can have some sort of clarity on what I am supposed to be doing right now. Please respond ASAP as I am struggling so much."
    click_button('Submit')
    expect(page).to have_content("Question is created!")
    expect(page).to have_content("I am having a hard time coming up with ideas for my breakable toy. Can someone help me?")

  end

  scenario 'notify and prevent a question creation when title or description does not meet the requirement' do
    visit new_question_path

    fill_in "Title", with: "!!!"
    fill_in "Description", with: "hehehe. This is not gonna be 150 characters long!!!"
    click_button('Submit')

    expect(page).to have_content('Invalid input.')
    expect(page).to have_content('Title')
    expect(page).to have_content('Description')
    expect(page).to have_button('Submit')

  end
end
