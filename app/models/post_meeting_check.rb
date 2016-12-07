class PostMeetingCheck < ApplicationRecord
  # Direct associations

  belongs_to :meeting,
             :foreign_key => "check_id",
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
