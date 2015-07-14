class User < ActiveRecord::Base
  devise :trackable, :omniauthable,
         :omniauth_providers => [:colorgy]
  has_many :user_courses
  has_many :user_followed_users
  has_many :followed_users, class_name: :User, through: :user_followed_users,
                            source: :followed_user
  has_many :user_followed_by_user, class_name: :UserFollowedUser, foreign_key: :followed_user_id
  has_many :followers, class_name: :User, through: :user_followed_by_user,
                       source: :user

  def self.from_colorgy(auth)
    user = where(:id => auth.info.id).first_or_create! do |new_user|
      new_user.email = auth[:info][:email]
    end

    attrs = %i(username name avatar_url cover_photo_url gender fbid uid identity organization_code department_code)

    oauth_params = ActionController::Parameters.new(auth.info)
    user_data = oauth_params.slice(*attrs).permit(*attrs)

    user_data['refreshed_at'] = Time.now
    user_data['core_access_token'] = auth.credentials.token

    user.update!(user_data)

    return user
  end
end
