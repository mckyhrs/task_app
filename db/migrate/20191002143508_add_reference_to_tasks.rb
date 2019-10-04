class AddReferenceToTasks < ActiveRecord::Migration[6.0]
  def change
		add_column :tasks, :user_id, :integer
		add_foreign_key :tasks, :users, column: :user_id
  end
end
