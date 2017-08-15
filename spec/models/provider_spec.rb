require 'rails_helper'

RSpec.describe Provider, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: providers
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  settings     :jsonb
#  adapter_type :string           not null
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_providers_on_name     (name) UNIQUE
#  index_providers_on_user_id  (user_id)
#
