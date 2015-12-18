require 'rails_helper'

feature 'view question details' do
  scenario 'see the title and description for each question' do
    question = Question.create(title: 'How do I make this rails app run without any error?', description: 'Just installed rails and rake command is not working at all. Please help me to debug this thing. This must exceed 150 characters. I do not know how to exceed that unless I write useless stuff. cmon. I am running out of things to say. Give me a break!!!!!!!?', creator_id: 1)

    visit questions_path
    visit question_path(question.id)

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.created_at)
    expect(page).to have_content(question.updated_at)
    expect(page).to have_content(question.description)
  end
end
