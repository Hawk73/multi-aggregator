require 'rails_helper'

RSpec.describe Request, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  user_id    :integer          not null
#  name       :string           not null
#  state      :string           not null
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_requests_on_name     (name) UNIQUE
#  index_requests_on_user_id  (user_id)
#
