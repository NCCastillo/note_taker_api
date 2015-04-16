class NoteSerializer < ActiveModel::Serializer
  attributes :id, :body, :note_taken_at
end
