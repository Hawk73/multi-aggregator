class Request < ApplicationRecord
  default_scope { order(created_at: :asc) }

  belongs_to :user
  validates_presence_of :user

  validates :name, presence: { allow_blank: false }, uniqueness: true

  validates :text, presence: { allow_blank: false }

  state_machine initial: :draft do
    event(:complete) { transition :processing => :completed }
    event(:failure) { transition :processing => :failed }
    event(:process) { transition [:draft, :failed] => :processing }
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
