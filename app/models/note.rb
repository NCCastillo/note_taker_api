class Note < ActiveRecord::Base
  validates_presence_of :body, :note_taken_at
end
