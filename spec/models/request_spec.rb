require 'rails_helper'

RSpec.describe Request, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  job_id     :integer
#  text       :text             not null
#  state      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_requests_on_user_id_and_job_id  (user_id,job_id) UNIQUE
#
