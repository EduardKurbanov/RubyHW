class Api::V1::TagSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at
end
