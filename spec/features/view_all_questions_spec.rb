require 'rails_helper'

feature 'view all questions' do
  scenario 'see the title of each question' do
    question = Question.create(title: 'How do I make this rails app run without any error?', description: 'This gets seeded first. This should be below another question. Just installed rails and rake command is not working at all. Please help me to debug this thing. This must exceed 150 characters. I do not know how to exceed that unless I write useless stuff. cmon. I am running out of things to say. Give me a break!!!!!!!', creator_id: 1)

    visit questions_path
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.updated_at)
  end
end
