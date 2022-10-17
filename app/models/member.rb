class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :timeoutable

  has_many :tasks, as: :owner, dependent: :destroy
  has_many :projects, through: :tasks

  enum role: { user: 0, admin: 1 }, _suffix: :role

  validates :email,
            email_format: true,
            uniqueness: true,
            presence: true
  validates :first_name, :last_name, presence: true
end
