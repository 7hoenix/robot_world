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
      robot_id = RobotWorld.create(attributes)

      robo = RobotWorld.find(robot_id)
      expect(robo.birthday.to_s).to eq("1986-07-12 00:00:00 -0600")
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

      other_attributes = { :name => "Drew",
                    :city => "New York",
                    :state => "NY",
                    :avatar => "DrewNew York",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "Engineering",
      }
      robot_id = RobotWorld.create(other_attributes)

      expected = RobotWorld.find(robot_id)
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
      robot_id = RobotWorld.create(attributes)

      new_attributes = {:id => 1,
                        :name => "Paul",
                        :city => "Missouri",
                        :state => "KA",
                        :birthday => "12-07-1986",
                        :date_hired => "12-07-1986",
                        :department => "Programming",
      }
      RobotWorld.update(robot_id, new_attributes)

      expected = RobotWorld.find(robot_id)

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
      robot_id = RobotWorld.create(attributes)

      new_attributes = {:name => "Drew",
                    :city => "New York",
                    :state => "NY",
                    :avatar => "DrewNew York",
                    :birthday => "12-07-1986",
                    :date_hired => "12-07-1986",
                    :department => "Engineering",
      }
      another_robot_id = RobotWorld.create(new_attributes)

      newer_attributes = {:name => "Paul",
                        :city => "Missouri",
                        :state => "KA",
                        :birthday => "12-07-1986",
                        :date_hired => "12-07-1986",
                        :department => "Programming",
      }
      yet_another_robot_id = RobotWorld.create(newer_attributes)

      expect(RobotWorld.all.map { |robot| robot.id }).to eq([robot_id,
        another_robot_id, yet_another_robot_id])
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
      robot_id = RobotWorld.create(attributes)

      all = RobotWorld.all

      expect(all.last.name).to eq("Drew")

      RobotWorld.delete(robot_id)

      all = RobotWorld.all

      expect(all.last.name).to eq("justin")

    end
  end
end
