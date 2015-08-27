require_relative "../spec_helper"

describe "Edit robot", :type => :feature do
  before :each do
    RobotWorld.delete_all
  end

  it "Updates a robot" do
      attributes = {:id => 1,
                    :name => "justin",
                    :city => "Denver",
                    :state => "CO",
                    :avatar => "justinDenver",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "Marketing",
      }
      RobotWorld.create(attributes)

    visit "/robots"
    expect(page).to have_content("justin")

    visit "/robots/1/edit"
    fill_in("robot[name]", with: "Phoenix")
    fill_in("robot[city]", with: "Sacremento")
    click_button("Submit")

    save_and_open_page
    expect(page).to have_content("Phoenix")
    expect(page).to have_content("Sacremento")
    expect(page).to have_content("Marketing")
  end
end
