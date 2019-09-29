require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
	before do
		@task = Task.create!(task_name: 'Test task', content: 'This is the test task.', limit_date: '2019-10-30')
		Task.create!(task_name: 'Test task2', content: 'This is the test task.', limit_date: '2019-11-30')
		Task.create!(task_name: 'Test task3', content: 'This is the test task.', limit_date: '2019-12-30')
	end

	it 'タスク登録' do
		# 新規作成画面を表示
		visit new_task_path

		# フォームに入力
		fill_in 'タスク', with: 'Test task'
		fill_in '説明', with: 'This is the test task.'
		select '2019', from: 'task_limit_date_1i'
		select '10月', from: 'task_limit_date_2i'
		select '30', from: 'task_limit_date_3i'

		# 新規作成ボタン 
		click_on '登録'
	
		# 検証
		expect(page).to have_content '登録しました！'
	end	

	it 'タスク編集' do
		# 編集画面を表示
		visit edit_task_path(@task)

		# フォームを編集
		fill_in 'タスク', with: 'Updated test task'
		fill_in '説明', with: 'Test task was updated.'
		select '2019', from: 'task_limit_date_1i'
		select '10月', from: 'task_limit_date_2i'
		select '30', from: 'task_limit_date_3i'

		# 更新ボタン
		click_on '更新'

		# 検証
		expect(page).to have_content '更新しました！'
		expect(page).to have_content 'Updated test task'
		expect(page).to have_content 'Test task was updated.'
		expect(page).to have_content '2019-10-30'
	end	

	it 'タスク削除' do
		# 編集画面を表示
		visit task_path(@task)

		# 更新ボタン
		click_link '削除'

		# 検証
		expect(page).to have_content '削除しました！'
	end	

	it 'タスク一覧' do
		# 新規作成画面を表示
		visit tasks_path

		# 検証
		expect(page).to have_content 'Test task'
		expect(page).to have_content '2019-10-30'
	end	

	it 'タスク一覧_終了期限の昇順' do
		# 一覧画面を表示
		visit tasks_path

		click_link '▲'

		limit_dates = all('.limit_date')
		# 検証
		expect(limit_dates[0]).to have_content '2019-10-30'
		expect(limit_dates[1]).to have_content '2019-11-30'
		expect(limit_dates[2]).to have_content '2019-12-30'
	end	

	it 'タスク一覧_終了期限の降順' do
		# 一覧画面を表示
		visit tasks_path

		click_link '▼'

		limit_dates = all('.limit_date')
		# 検証
		expect(limit_dates[0]).to have_content '2019-12-30'
		expect(limit_dates[1]).to have_content '2019-11-30'
		expect(limit_dates[2]).to have_content '2019-10-30'
	end	
end
