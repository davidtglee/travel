class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :albums, :dependent => :destroy
         has_many :likes, :dependent => :destroy
         has_many :sent_friend_requests, :class_name => "FriendRequest", :foreign_key => "sender_id", :dependent => :destroy
         has_many :received_friend_requests, :class_name => "FriendRequest", :foreign_key => "recipient_id", :dependent => :destroy
         has_many :likedphotos, :through => :albums, :source => :photos
has_many :followings, :through => :sent_friend_requests, :source => :recipient
has_many :followers, :through => :received_friend_requests, :source => :sender


end
