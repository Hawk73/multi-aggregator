FactoryGirl.define do
  factory :comment do
    sequence(:text) { |n| "comment_text_#{n}" }

    snippet
    user
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  snippet_id :integer
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_snippet_id  (snippet_id)
#
