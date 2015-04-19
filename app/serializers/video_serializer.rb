class VideoSerializer < ActiveModel::Serializer
  attributes :title, :image, :slug, :description, :host, :embed_code
end
