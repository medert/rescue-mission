require 'rails_helper'

feature 'delete a question' do
  before do
    @question = FactoryGirl.create(:question)
    visit question_path(@question)
  end

  scenario 'question gets deleted from the edit page' do
    click_button 'edit'
    click_button 'delete'

    expect(page).to have_content("You have successfully deleted your question!")
    expect(page).to have_no_content("This is a factory girl driven question title. Use at your own risk. What is factory girl?")
  end

  scenario 'question gets deleted from the show page' do
    click_button 'delete'

    expect(page).to have_content("You have successfully deleted your question!")
    expect(page).to have_no_content("This is a factory girl driven question title. Use at your own risk. What is factory girl?")
  end
end
