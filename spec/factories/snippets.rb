FactoryGirl.define do
  factory :snippet do
    sequence(:name) { |n| "snippet_name_#{n}" }
    sequence(:text) { |n| "snippet_text_#{n}" }

    user
  end
end

# == Schema Information
#
# Table name: snippets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  text       :text
#  settings   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_snippets_on_name     (name) UNIQUE
#  index_snippets_on_user_id  (user_id)
#
