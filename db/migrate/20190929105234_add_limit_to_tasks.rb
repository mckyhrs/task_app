class AddLimitToTasks < ActiveRecord::Migration[6.0]
  def change
		add_column :tasks, :limit_date, :date
  end
end
