class Photo < ApplicationRecord
  has_many :likes, :dependent => :destroy
has_one :location, :dependent => :destroy
belongs_to :album
has_one :fans, :through => :album, :source => :user
validates :image, :presence => true


end
