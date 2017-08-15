class Provider < ApplicationRecord
  belongs_to :user
  validates_presence_of :user

  has_many :requests, dependent: :destroy

  validates :name, presence: { allow_blank: false }, uniqueness: true

  validates :adapter_type, presence: { allow_blank: false }

  serialize :settings, JSON
  validates :settings, presence: { allow_blank: false }
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
