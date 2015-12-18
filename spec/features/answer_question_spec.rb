require 'rails_helper'
require 'launchy'

feature 'answer a question' do
  question = Question.create(title: 'How do I make this rails app run without any error?', description: 'Just installed rails and rake command is not working at all. Please help me to debug this thing. This must exceed 150 characters. I do not know how to exceed that unless I write useless stuff. cmon. I am running out of things to say. Give me a break!!!!!!!?', creator_id: 1)

  scenario 'post a new answer if description is filled in ' do

    visit question_path(question.id)

    fill_in "Description", with: "Breakable toy is weighing heavy on my mind and I cannot fall asleep. My life is miserable. I will only be able to find a peace of mind if I can have some sort of clarity on what I am supposed to be doing right now. Please respond ASAP as I am struggling so much."
    click_button('Submit')

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.created_at)
    expect(page).to have_content(question.updated_at)
    expect(page).to have_content(question.description)

    expect(page).to have_content("Breakable toy is weighing heavy on my mind and I cannot fall asleep. My life is miserable. I will only be able to find a peace of mind if I can have some sort of clarity on what I am supposed to be doing right now. Please respond ASAP as I am struggling so much.")
  end

  scenario 'notify and prevent an answer from posting when description does not meet the requirement' do

    visit question_path(question.id)

    fill_in "Description", with: "Breakable toy is weighing heavy on my mind."
    click_button('Submit')

    expect(page).to have_content("Your answer must be at least 50 characters long.")
    expect(page).to have_content('Description')
    expect(page).to have_button('Submit')
  end

  scenario 'save and redisplay when a valid answer has been filled in' do
    visit question_path(question.id)

    fill_in "Description", with: "Breakable toy is weighing heavy on my mind."
    click_button('Submit')

    expect(page).to have_content("Your answer must be at least 50 characters long.")
    expect(page).to have_content('Description')
    expect(page).to have_button('Submit')


    fill_in "Description", with: "Breakable toy is weighing heavy on my mind and I cannot fall asleep. My life is miserable. I will only be able to find a peace of mind if I can have some sort of clarity on what I am supposed to be doing right now. Please respond ASAP as I am struggling so much."
    click_button('Submit')

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.created_at)
    expect(page).to have_content(question.updated_at)
    expect(page).to have_content(question.description)

    expect(page).to have_content("Breakable toy is weighing heavy on my mind and I cannot fall asleep. My life is miserable. I will only be able to find a peace of mind if I can have some sort of clarity on what I am supposed to be doing right now. Please respond ASAP as I am struggling so much.")
  end

end
