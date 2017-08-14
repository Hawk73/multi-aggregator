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
#  name         :string           not null
#  adapter_type :string           not null
#  settings     :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_providers_on_user_id           (user_id)
#  index_providers_on_user_id_and_name  (user_id,name) UNIQUE
#
