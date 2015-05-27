class UserFollowedUser < ActiveRecord::Base
	belongs_to :user, class_name: :User, foreign_key: :user_id
	belongs_to :followed_user, class_name: :User, foreign_key: :followed_user_id

end
