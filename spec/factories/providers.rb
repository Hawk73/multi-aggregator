FactoryGirl.define do
  factory :provider do
    sequence(:name) { |n| "provider_name_#{n}" }
    sequence(:text) { |n| "provider_text_#{n}" }

    user
  end
end

# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  type       :string           not null
#  settings   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_providers_on_user_id           (user_id)
#  index_providers_on_user_id_and_name  (user_id,name) UNIQUE
#
