require 'rails_helper'

feature 'edit a question' do
  before do
    @question = FactoryGirl.create(:question)
    visit question_path(@question)
  end

  scenario 'question gets editted when the form has valid information' do
    click_button 'edit'
    fill_in "Title", with: "I am editting this question. Watch out!!!"
    fill_in "Description", with: "Now this edit is going to take awhile. Who the heck requires 150 characters to describe a freaking question? Now, let's be real. What if you want to simply ask How are you? That would not extend to 150 characters. Let's real......"
    click_button 'Submit'

    expect(page).to have_content("You have successfully updated your question!")
    expect(page).to have_content("I am editting this question. Watch out!!!")
    expect(page).to have_content("Now this edit is going to take awhile. Who the heck requires 150 characters to describe a freaking question? Now, let's be real. What if you want to simply ask How are you? That would not extend to 150 characters. Let's real......")
    expect(page).to have_content(@question.updated_at)
  end

  scenario 'raises an error when the form has invalid information' do
    click_button 'edit'
    fill_in "Title", with: "This will not go through."
    fill_in "Description", with: "..."
    click_button('Submit')

    expect(page).to have_content("Invalid input.")
    expect(page).to have_field('Title', with: "This will not go through.")
    expect(page).to have_field('Description', with: "...")
  end
end
