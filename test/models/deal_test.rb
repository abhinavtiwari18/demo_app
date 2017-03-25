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

require 'test_helper'

class DealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
