class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attr| attr['name'].blank? }
  include Placeholder
  after_create :set_defaults
  validates_presence_of :title, :body, :thumb_image, :main_image
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image,  PortfolioUploader

  scope :ror_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular, -> { where(subtitle: 'Angular') }

  def self.by_position
    order("position ASC")
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
