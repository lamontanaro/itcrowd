class User < ActiveRecord::Base
  devise :database_authenticatable,
    :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
