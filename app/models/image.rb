class Image < ApplicationRecord
  belongs_to :product
  has_one_attached :image, service: :amazon

  def url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
