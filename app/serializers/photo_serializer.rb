class PhotoSerializer < ActiveModel::Serializer
  attributes :small, :large

  def small
    object.file.small.url
  end

  def large
    object.file.large.url
  end
end
