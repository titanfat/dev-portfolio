class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  scope :ror_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular, -> { where(subtitle: 'Angular') }

  after_initialize :set_default

  def set_default
    self.main_image ||= 'https://via.placeholder.com/600x200'
    self.thumb_image ||= 'https://via.placeholder.com/350x200'
  end
end
