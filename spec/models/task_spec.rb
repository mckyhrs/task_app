require 'rails_helper'

RSpec.describe Task, type: :model do

	it 'タスクが未入力' do
		task = Task.new(task_name: '')
		task.valid?
		expect(task.errors[:task_name]).to include('を入力してください')
	end	
end
