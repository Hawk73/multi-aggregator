class Provider < ApplicationRecord
  serialize :settings, JSON

  belongs_to :user
  validates_presence_of :user

  has_many :requests, dependent: :destroy

  # TODO: uniqueness by user and name
  validates :name, presence: { allow_blank: false }, uniqueness: true

  validates :adapter_type, presence: { allow_blank: false }
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
