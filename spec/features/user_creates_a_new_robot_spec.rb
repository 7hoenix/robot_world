require_relative "../spec_helper"

describe "New robot", :type => :feature do
  before :each do
    # RobotWorld.delete_all
  end

  it "creates a new robot" do
    visit "/robots/new"
    fill_in("robot[name]", with: "phoenix")
    fill_in("robot[city]", with: "Sacremento")
    fill_in("robot[state]", with: "CA")
    fill_in("robot[birthday]", with: "12-07-1985")
    fill_in("robot[date_hired]", with: "12-07-2000")
    fill_in("robot[department]", with: "Human Resources")
    click_button("Submit")

    expect(page).to have_content("phoenix")
    expect(page).to have_content("Human Resources")
  end
end
