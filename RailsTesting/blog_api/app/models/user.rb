class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    # :recoverable, :rememberable, :trackable,
    :validatable, :token_authenticatable

  def role?(role)
    return !!roles.find_by_name(role.to_s)
  end
end
