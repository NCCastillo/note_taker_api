class Note < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body, :note_taken_at
end
