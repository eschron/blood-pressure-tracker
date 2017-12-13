class Entry < ApplicationRecord
  validates :time, presence: true
  validates :systolic, presence: true
  validates :diastolic, presence: true

  belongs_to :user
end
