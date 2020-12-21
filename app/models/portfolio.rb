class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :subtitle
end
