class User < ApplicationRecord
  belongs_to :role

  has_many :usercourses
  has_many :courses, :through => :usercourses, foreign_key: :course_id

  scope :Instructor, -> {where(role_id: Role.find_by_description(:Instructor).id)}
  scope :Student, -> {where(role_id: Role.find_by_description(:Student).id)}

  validates :name, presence: true, length: {maximum: 30}
  validates :surname, presence: true, length: {maximum: 30}
  validates :email, presence: true
  validates_format_of :email, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  # validates password
  #validates_format_of :password, with: /^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$/
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
