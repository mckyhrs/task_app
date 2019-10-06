require 'rails_helper'

RSpec.describe 'Users', type: :system do
	before do
		User.create!(user_name: 'adminuser', login_id: 'admin', password: 'password', role: 1)
		
		# ログイン
		visit login_path
		fill_in 'ID', with: 'admin'
		fill_in 'Password', with: 'password'
		click_on 'Login'

		@task = User.create!(user_name: 'testuser', login_id: 'loginid', password: 'password', role: 0)
		User.create!(user_name: 'testuser2', login_id: 'loginid2', password: 'password', role: 0)
		User.create!(user_name: 'testuser3', login_id: 'loginid3', password: 'password', role: 0)

	end

	it 'ユーザー登録' do
		# 新規作成画面を表示
		visit new_admin_user_path

		# フォームに入力
		fill_in 'ユーザー名', with: 'testuser4'
		fill_in 'ログインID', with: 'loginid4'
		fill_in 'パスワード', with: 'password'

		# 新規作成ボタン 
		click_on '登録'
	
		# 検証
		expect(page).to have_content '登録しました！'
		expect(page).to have_content 'testuser4'
	end	

	it 'ユーザー編集' do
		# 編集画面を表示
		visit edit_admin_user_path(@task)

		# フォームを編集
		fill_in 'ユーザー名', with: 'updateduser'
		fill_in 'ログインID', with: 'updatedloginid'
		fill_in 'パスワード', with: 'password'

		# 更新ボタン
		click_on '更新'

		# 検証
		expect(page).to have_content '更新しました！'
		expect(page).to have_content 'updateduser'
		expect(page).to have_content 'updatedloginid'
	end	

	it 'ユーザー削除' do
		# 一覧画面を表示
		visit admin_users_path

		# 削除ボタン
		all('tbody tr')[3].click_link '削除'

		# 検証
		expect(page).to have_content '削除しました！'
		expect(page).not_to have_content 'testuser3'
	end	

	it 'ユーザー一覧' do
		# 一覧画面を表示
		visit admin_users_path

		# 検証
		expect(page).to have_content 'testuser'
		expect(page).to have_content 'testuser2'
		expect(page).to have_content 'testuser3'
	end	
end
