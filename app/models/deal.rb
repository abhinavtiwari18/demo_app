# == Schema Information
#
# Table name: deals
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  description          :text(65535)
#  price                :integer
#  discounted_price     :integer
#  quantity             :integer
#  publish_date         :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Deal < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  has_many :orders
  has_many :users, through: :orders
end
