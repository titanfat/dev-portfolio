class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :subtitle
  scope :ror_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular, -> { where(subtitle: 'Angular') }
end
