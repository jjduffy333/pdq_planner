class Person < ApplicationRecord
  # Direct associations

  belongs_to :meeting,
             :class_name => "SharedMeeting"

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
