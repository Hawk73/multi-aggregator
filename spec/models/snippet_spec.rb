require 'rails_helper'

RSpec.describe Snippet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
