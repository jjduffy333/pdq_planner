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

  validates :benefit, :presence => true

  validates :date, :presence => true

  validates :location, :presence => true

  validates :purpose, :presence => true

  validates :time, :presence => true

  validates :title, :presence => true

end
