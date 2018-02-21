class DBStorage
  def initialize(task_model)
    @tasks = task_model
  end

  def sample(number_of_tasks)
    tasks = @tasks.all(done: false, limit: number_of_tasks)
    tasks.update(done: true)

    tasks.map do |task|
      {
        'name' => task.name,
        'params' => JSON.parse(task.params)
      }
    end
  end
end
