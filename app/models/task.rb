class Task < ApplicationRecord
	enum status: { waiting: 0, working: 1, completed: 2 }
	enum priority: { low: 0, middle: 1, high: 2 }
	validates :task_name, presence: true

	# 検索
	def self.search(task_name, status)
		tasks = Task.all
		if task_name.present?
			tasks = tasks.where("task_name LIKE '%#{task_name}%'")
		end
		if status.present?
			tasks = tasks.where("status = #{status}")
		end
		tasks
	end
end
