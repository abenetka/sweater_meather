require 'rails_helper'

describe "as a visitor" do
  it 'sees welcome page' do
    visit root_path

    expect(page).to have_content("Welcome, Visitor!")
  end

end
