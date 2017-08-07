require 'byebug'

class Employee
  attr_accessor :salary, :name, :title, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end


end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, *employees)
    super(name, title, salary, boss)
    @employees = employees

  end

  def bonus(multiplier)
    # debugger

    return @salary * multiplier if @employees.nil?

    totals = @employees.reduce(0) do |accum, emp|
      accum += (emp.bonus(multiplier) + multiplier * emp.salary)
    end

  end

end

shawna = Employee.new('Shawna', 'TA', 12_000, 'Darren')
david = Employee.new('David', 'TA', 10_000, 'Darren')
darren = Manager.new('Darren', 'TA Manager', 78_000, 'Ned', shawna, david)
ned = Manager.new('Ned', 'Founder', 1_000_000, nil, darren)
