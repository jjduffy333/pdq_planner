class MeetingAttendance < ApplicationRecord
  # Direct associations

  belongs_to :meeting,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
