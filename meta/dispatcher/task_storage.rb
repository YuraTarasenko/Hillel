class TaskStorage
  DEFAULT_TASKS = [
    { 'name' => 'time', 'params' => {} },
    { 'name' => 'stop', 'params' => {} },
    { 'name' => 'date', 'params' => {} },
    { 'name' => 'weather', 'params' => { 'city_name' => 'Odessa' } },
    { 'name' => 'location', 'params' => {} },
    { 'name' => 'sleep', 'params' => { 'time' => rand(10) } }
  ]

  def initialize
    @tasks = []
    initialize_standard_tasks
  end

  def sample(number_of_tasks)
    @tasks.sample(number_of_tasks)
  end

  private

  def initialize_standard_tasks
    @tasks += DEFAULT_TASKS
  end
end
