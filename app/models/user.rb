class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader

  # Direct associations

  has_many   :post_meeting_checks,
             :dependent => :destroy

  has_many   :meeting_attendances,
             :dependent => :destroy

  has_many   :shared_meetings,
             :dependent => :nullify

  has_many   :people,
             :class_name => "Contact",
             :dependent => :destroy

  has_many   :meetings,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
