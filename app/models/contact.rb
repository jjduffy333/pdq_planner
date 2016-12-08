class Contact < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :meeting,
             :class_name => "SharedMeeting"

  belongs_to :user,
             :counter_cache => :people_count

  # Indirect associations

  # Validations

end
