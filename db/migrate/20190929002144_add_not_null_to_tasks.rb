class AddNotNullToTasks < ActiveRecord::Migration[6.0]
  def change
		change_column_null :tasks, :task_name, false
  end
end
