FactoryGirl.define do
  factory :request do
    sequence(:name) { |n| "request_name_#{n}" }
    sequence(:text) do |n|
      'SELECT db_a.table_a.field_a ' \
      'FROM db_a.table_a ' \
      'INNER JOIN db_b.table_b ON (db_a.table_a.id = db_b.table_b.id) '\
      "WHERE db_b.table_b.field_b > #{n};"
    end

    user
  end
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
