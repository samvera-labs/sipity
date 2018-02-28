module Sipity
  RSpec.describe Agent, type: :model do
    subject { described_class }

    describe 'column_names' do
      subject { described_class.column_names }
      it { is_expected.to include("proxy_for_global_id") }
    end
  end
end
