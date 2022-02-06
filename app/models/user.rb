class User < ApplicationRecord
  has_many :campaigns
  has_many :notes
  has_many :useful_links
  has_many :campaign_members

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
