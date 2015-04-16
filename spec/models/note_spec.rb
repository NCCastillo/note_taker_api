require 'rails_helper'

describe Note, type: :model do
  let(:note) { build(:note, body: nil, note_taken_at: nil) }

  it 'is not valid' do
    expect(note.valid?).to be false
    expect(note.errors.full_messages).to eq ["Body can't be blank", "Note taken at can't be blank"]
  end

  it 'is valid' do
    note.body = "This is a body of a note."
    note.note_taken_at = Time.now

    expect(note.valid?).to be true
  end
end
