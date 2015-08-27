require_relative '../spec_helper'

describe "Robot index", :type => :feature do
  it "displays all robots" do
    visit "/robots"
    expect(page).to have_css("#robots")
  end
end
