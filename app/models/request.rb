class Request < ApplicationRecord
  default_scope { order(created_at: :asc) }

  belongs_to :user
  validates_presence_of :user

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
#  user_id    :integer          not null
#  job_id     :integer
#  text       :text             not null
#  state      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_requests_on_user_id_and_job_id  (user_id,job_id) UNIQUE
#
