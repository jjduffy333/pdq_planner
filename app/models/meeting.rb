class Meeting < ApplicationRecord
  # Direct associations

  has_many   :meeting_attendances,
             :dependent => :destroy

  has_many   :post_meeting_checks,
             :foreign_key => "check_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
