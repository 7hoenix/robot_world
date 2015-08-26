class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department

  def initialize(robot)
    @id         = robot.fetch("id")
    @name       = robot.fetch("name")
    @city       = robot.fetch("city")
    @state      = robot.fetch("state")
    @avatar     = robot.fetch("avatar")
    @birthday   = robot.fetch("birthday")
    @date_hired = robot.fetch("date_hired")
    @department = robot.fetch("department")
  end
end
