class Appointment < ApplicationRecord
  validates  :start_time, uniqueness: true
  validates  :name, :start_time, presence: true
  belongs_to :user, optional: true
  belongs_to :stylist, optional: true
end
