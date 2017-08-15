FactoryGirl.define do
  factory :provider do
    sequence(:name) { |n| "provider_name_#{n}" }
    adapter_type :postgresql
    sequence(:settings) do |n|
      {
        database: "database_#{n}",
        encoding: 'utf8',
        host: 'localhost',
        password: 'password',
        pool: 5,
        timeout: 5000,
        username: 'username',
      }
    end

    user
  end
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
