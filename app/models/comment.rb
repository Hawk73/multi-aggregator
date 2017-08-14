class Comment < ApplicationRecord
  default_scope { order(created_at: :asc) }

  belongs_to :user
  validates_presence_of :user

  belongs_to :snippet
  validates_presence_of :snippet

  validates :text, presence: { allow_blank: false }
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
