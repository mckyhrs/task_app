class User < ApplicationRecord
    enum role: { general: 0, admin: 1 }

    before_destroy :check_no_one_has_admin

    has_many :tasks, dependent: :destroy
	validates :user_name, presence: true
	validates :login_id, presence: true, uniqueness: true
    has_secure_password

    private
        # 管理ユーザーが一人の場合、そのユーザーは削除不可とする
        def check_no_one_has_admin
            if User.admin.size == 1 && User.admin.first.id == self.id
                throw(:abort)
            end
        end
end
