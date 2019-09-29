class AddNotNullToTasks < ActiveRecord::Migration[6.0]
  def change
		change_column :tasks, :task_name, null: false
  end
end
