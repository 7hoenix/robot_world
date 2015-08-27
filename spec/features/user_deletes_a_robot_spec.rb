require_relative "../spec_helper"

describe "Delete robot", :type => :feature do
  before :each do
    RobotWorld.delete_all
  end

  it "deletes a robot" do
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
      click_on("View justin")
      expect(page).to have_content("Marketing")
      click_on("Delete")
      expect(page).to_not have_content("justin")
  end
end
