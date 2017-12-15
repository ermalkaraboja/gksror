class Assesment < ApplicationRecord
  validates :weight, :inclusion => {:in => 0..1}
  validates :title, presence: true, :length => {minimum: 3, :maximum => 30}
end
