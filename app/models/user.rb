class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # belongs_to :role, optional: true
  # delegate :permissions, to: :role
  # has_one :worker, dependent: :destroy
  has_many :role_assignments, dependent: :destroy
  has_many :roles, through: :role_assignments
  has_many :inventory

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def can?(&block)
    roles.map(&:permissions).any?(&block)
  end

  def computed_permissions
    roles.map(&:computed_permissions).reduce(RoleCore::ComputedPermissions.new, &:concat)
  end

  def active_for_authentication?
    super && state
  end

end
