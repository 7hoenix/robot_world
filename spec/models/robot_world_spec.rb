require_relative "../spec_helper"

RSpec.describe RobotWorld do
  before :each do
    RobotWorld.delete_all
  end

  describe ".create" do
    it "creates a new robot" do
      attributes = {:id => 1,
                    :name => "justin",
                    :city => "Denver",
                    :state => "CO",
                    :avatar => "justinDenver",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "marketing",
      }
      RobotWorld.create(attributes)

      robo = RobotWorld.find(1)
      expect(robo.birthday).to eq("12-07-1986")
    end
  end

  describe ".find" do
    it "finds a robot" do
      attributes = {:id => 1,
                    :name => "justin",
                    :city => "Denver",
                    :state => "CO",
                    :avatar => "justinDenver",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "marketing",
      }
      RobotWorld.create(attributes)

      other_attributes = {:id => 2,
                    :name => "Drew",
                    :city => "New York",
                    :state => "NY",
                    :avatar => "DrewNew York",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "Engineering",
      }
      RobotWorld.create(other_attributes)

      expected = RobotWorld.find(2)
      expect(expected.state).to eq("NY")
    end
  end

  describe ".update" do
    it "updates a robots information" do
      attributes = {:id => 1,
                    :name => "justin",
                    :city => "Denver",
                    :state => "CO",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "marketing",
      }
      RobotWorld.create(attributes)

      new_attributes = {:id => 1,
                        :name => "Paul",
                        :city => "Missouri",
                        :state => "KA",
                        :birthday => "12-07-1986",
                        :date_hired => "12-07-1986",
                        :department => "Programming",
      }
      RobotWorld.update(1, new_attributes)

      expected = RobotWorld.find(1)

      expect(expected.state).to eq("KA")
    end
  end

  describe ".all" do
    it "returns an array of all robot instances" do
      attributes = {:name => "justin",
                    :city => "Denver",
                    :state => "CO",
                    :avatar => "justinDenver",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "marketing",
      }
      RobotWorld.create(attributes)

      new_attributes = {:name => "Drew",
                    :city => "New York",
                    :state => "NY",
                    :avatar => "DrewNew York",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "Engineering",
      }
      RobotWorld.create(new_attributes)

      newer_attributes = {:name => "Paul",
                        :city => "Missouri",
                        :state => "KA",
                        :birthday => "12-07-1986",
                        :date_hired => "12-07-1986",
                        :department => "Programming",
      }
      RobotWorld.create(newer_attributes)

      expect(RobotWorld.all.map { |robot| robot.id }).to eq([1 ,2, 3])
    end
  end

  describe ".delete" do
    it "deletes a robot" do
      attributes = {:id => 1,
                    :name => "justin",
                    :city => "Denver",
                    :state => "CO",
                    :avatar => "justinDenver",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "marketing",
      }
      RobotWorld.create(attributes)

      attributes = {:id => 2,
                    :name => "Drew",
                    :city => "New York",
                    :state => "NY",
                    :avatar => "DrewNew York",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "Engineering",
      }
      RobotWorld.create(attributes)

      all = RobotWorld.all

      expect(all.count).to eq(2)
      expect(all.last.name).to eq("Drew")

      RobotWorld.delete(2)

      all = RobotWorld.all

      expect(all.count).to eq(1)
      expect(all.last.name).to eq("justin")

    end
  end
end
