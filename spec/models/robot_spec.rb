require_relative "../spec_helper"

RSpec.describe Robot do
  describe "#initialize" do
    it "assigns the proper attributes" do
      attributes = {"id" => 1,
                    "name" => "justin",
                    "city" => "Denver",
                    "state" => "CO",
                    "avatar" => "justinDenver",
                    "birthday" => "12-07-1986",
                    "date_hired" => "12-07-1986",
                    "department" => "marketing",
      }
      robo = Robot.new(attributes)

      expect(robo.id).to eq(1)
      expect(robo.name).to eq("justin")
      expect(robo.avatar).to eq("justinDenver")
      expect(robo.date_hired).to eq("12-07-1986")
    end
  end
end
