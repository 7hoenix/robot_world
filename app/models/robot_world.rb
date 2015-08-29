require 'yaml/store'
require 'sequel'

class RobotWorld
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world.sqlite3")
    end
  end

  def self.create_table
    database.create_table :robots do
      primary_key :id
      String      :name
      String      :city
      String      :state
      String      :avatar
      Date        :birthday
      Date        :date_hired
      String      :department
    end
  end

  def self.create(robot)
    database.from(:robots).insert( { name: robot[:name], city: robot[:city],
      state: robot[:state], avatar: robot[:avatar], birthday: robot[:birthday],
      date_hired: robot[:date_hired], department: robot[:department] } )
  end

  def self.update(id, robot)
    database.from(:robots).where(id: id).update ( { name: robot[:name], city: robot[:city], state: robot[:state], avatar: robot[:avatar], birthday: robot[:birthday], date_hired: robot[:date_hired], department: robot[:department] } )
  end

  def self.delete(id)
    database.from(:robots).where(id: id).delete
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    database.from(:robots).all.map do |data|
      Robot.new(data)
    end
  end

  def self.raw_robot(id)
    database.transaction do
      database['robots'].find { |robot| robot["id"] == id }
    end
  end

  def self.find(id)
    data = database.from(:robots).where(id: id).first
    Robot.new(data)
  end

  def self.delete_all
    database.from(:robots).delete
  end
end
