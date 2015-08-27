require_relative "../spec_helper"

describe "Show robot", :type => :feature do
  before :each do
    RobotWorld.delete_all
  end

  it "Shows a robot" do
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
  end
end
