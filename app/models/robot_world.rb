require 'yaml/store'
require_relative 'robot'

class RobotWorld
  def self.database
    @database ||= YAML::Store.new("db/robot_world")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      avatar = robot[:name] + robot[:city]
      database['robots'] << { "id" => database['total'], "name" => robot[:name], "city" => robot[:city], "state" => robot[:state], "avatar" => avatar, "birthday" => robot[:birthday], "date_hired" => robot[:date_hired], "department" => robot[:department] }
    end
  end

  def self.update(id, robot)
    database.transaction do
      target = database['robots'].find { |data| data["id"] == id }
       target["name"] = robot[:name]
       target["city"] = robot[:city]
       target["state"] = robot[:state]
       target["birthday"] = robot[:birthday]
       target["date_hired"] = robot[:date_hired]
       target["department"] = robot[:department]
    end
  end

  def self.delete(id)
    database.transaction do
      database['robots'].delete_if { |data| data["id"] == id }
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    database.transaction do
      database['robots'].find { |robot| robot["id"] == id }
    end
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end
end
