class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :conference, :short_code
end
