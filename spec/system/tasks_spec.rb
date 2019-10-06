require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
	before do
		User.create!(user_name: 'testuser1', login_id: 'loginid', password: 'password', role: 0)
		
		# ログイン
		visit login_path
		fill_in 'ID', with: 'loginid'
		fill_in 'Password', with: 'password'
		click_on 'Login'

		@task = Task.create!(task_name: 'Test task', content: 'This is the test task.', limit_date: '2019-10-30', status: 0, priority: 0, user_id: User.first.id)
		Task.create!(task_name: 'Test task2', content: 'This is the test task.', limit_date: '2019-11-30', status: 0, priority: 1, user_id: User.first.id)
		Task.create!(task_name: 'Test task3', content: 'This is the test task.', limit_date: '2019-12-30', status: 0, priority: 2, user_id: User.first.id)

	end

	it 'タスク登録' do
		# 新規作成画面を表示
		visit new_task_path

		# フォームに入力
		fill_in 'タスク', with: 'Test task4'
		fill_in '説明', with: 'This is the test task.'

		# 新規作成ボタン 
		click_on '登録'
	
		# 検証
		expect(page).to have_content '登録しました！'
		expect(page).to have_content 'Test task4'
	end	

	it 'タスク編集' do
		# 編集画面を表示
		visit edit_task_path(@task)

		# フォームを編集
		fill_in 'タスク', with: 'Updated test task'
		fill_in '説明', with: 'Test task was updated.'
		select '2020', from: 'task_limit_date_1i'
		select '11月', from: 'task_limit_date_2i'
		select '15', from: 'task_limit_date_3i'
		select '完了', from: 'task_status'
		select '中', from: 'task_priority'

		# 更新ボタン
		click_on '更新'

		# 検証
		expect(page).to have_content '更新しました！'
		expect(page).to have_content 'Updated test task'
		expect(page).to have_content 'Test task was updated.'
		expect(page).to have_content '2020-11-15'
		expect(page).to have_content '完了'
		expect(page).to have_content '中'
	end	

	it 'タスク削除' do
		# 一覧画面を表示
		visit tasks_path

		# 更新ボタン
		all('tbody tr')[0].click_link '削除'

		# 検証
		expect(page).to have_content '削除しました！'
		expect(page).not_to have_content 'Test task3'
	end	

	it 'タスク一覧' do
		# 一覧画面を表示
		visit tasks_path

		# 検証
		expect(page).to have_content 'Test task'
		expect(page).to have_content 'Test task2'
		expect(page).to have_content 'Test task3'
	end	

	it 'タスク一覧_終了期限の昇順' do
		# 一覧画面を表示
		visit tasks_path

		find('.sort-asc-limit').click
		sleep 2

		limit_dates = all('.limit_date')
		# 検証
		expect(limit_dates[0]).to have_content '2019-10-30'
		expect(limit_dates[1]).to have_content '2019-11-30'
		expect(limit_dates[2]).to have_content '2019-12-30'
	end	

	it 'タスク一覧_終了期限の降順' do
		# 一覧画面を表示
		visit tasks_path

		find('.sort-desc-limit').click
		sleep 2

		limit_dates = all('.limit_date')
		# 検証
		expect(limit_dates[0]).to have_content '2019-12-30'
		expect(limit_dates[1]).to have_content '2019-11-30'
		expect(limit_dates[2]).to have_content '2019-10-30'
	end	

	it 'タスク一覧_優先順位の昇順' do
		# 一覧画面を表示
		visit tasks_path

		find('.sort-asc-priority').click
		sleep 2

		priorities = all('.priority')
		# 検証
		expect(priorities[0]).to have_content '低'
		expect(priorities[1]).to have_content '中'
		expect(priorities[2]).to have_content '高'
	end	

	it 'タスク一覧_優先順位の降順' do
		# 一覧画面を表示
		visit tasks_path

		find('.sort-desc-priority').click
		sleep 2

		priorities = all('.priority')
		# 検証
		expect(priorities[0]).to have_content '高'
		expect(priorities[1]).to have_content '中'
		expect(priorities[2]).to have_content '低'
	end	
end
