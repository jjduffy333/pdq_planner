class SharedMeeting < ApplicationRecord
  # Direct associations

  has_many   :people,
             :class_name => "Contact",
             :foreign_key => "meeting_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
