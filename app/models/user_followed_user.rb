class UserFollowedUser < ActiveRecord::Base
	belongs_to :user, class_name: :User, foreign_key: :user_id
	belongs_to :followed_user, class_name: :User, foreign_key: :followed_user_id

	validates :user, :followed_user, presence: true
	validates :followed_user_id, uniqueness: { scope: :user_id }
end
