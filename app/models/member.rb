class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :timeoutable

  has_many :tasks, foreign_key: :owner_id, dependent: :destroy
  has_many :projects, through: :tasks

  enum role: { user: 0, admin: 1 }, _suffix: :role

  validates :email,
            email_format: true,
            uniqueness: true,
            presence: true
  validates :first_name, :last_name, presence: true

  scope :ordered, -> { order(:first_name) }

  def full_name
    [first_name, last_name].join(' ')
  end
end
