require 'rails_helper'

RSpec.describe RequestAttributesFinder do
  let(:text) do
    'SELECT db_a.table_a.field_a ' \
    'FROM db_a.table_a ' \
    'INNER JOIN db_b.table_b ON (db_a.table_a.id = db_b.table_b.id) '\
    'WHERE db_b.table_b.field_b > 10;'
  end

  def call
    subject.call(text)
  end

  context 'providers exist' do
    let(:request_attributes) do
      {
        'db_a' => {
          'table_a' => %w[
            field_a
            id
          ],
        },
        'db_b' => {
          'table_b' => %w[
            id
            field_b
          ],
        }
      }
    end

    before do
      provider_a = build(:provider)
      provider_a.settings['database'] = 'db_a'
      provider_a.save!

      provider_b = build(:provider)
      provider_b.settings['database'] = 'db_b'
      provider_b.save!
    end

    it 'returns request attributes' do
      expect(call).to eq(request_attributes)
    end

    # TODO: add specs
    context 'two "FROM"' do
    end

    context 'two "JOIN"' do
    end
  end

  context 'providers do not exist' do
    it 'raises ProviderNotFoundError error' do
      pending
      expect{ call }.to raise_error(described_class::ProviderNotFoundError)
    end
  end
end
