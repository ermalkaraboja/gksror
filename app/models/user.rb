class User < ApplicationRecord
  belongs_to :role

  validates :name, presence: true, length: {maximum: 30}
  validates :surname, presence: true, length: {maximum: 30}
  validates :email, presence: true
  validates_format_of :email, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  # validates password
  #validates_format_of :password, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :password, presence: true
  validates :role_id, presence: true

  validate :validate_role

  def matches_password? pass
    self.password == pass
  end

  def full_name
    self.name + ' ' + self.surname
  end

  private
  def validate_role
    if (self.role.blank? && self.role_id.blank?)
      errors.add(base, 'Role not specified!')
    end    
  end

end
