module Sipity
  RSpec.describe Workflow, type: :model do
    context 'class configuration' do
      subject { described_class }

      its(:column_names) { is_expected.to include('name') }
    end

    subject { create(:workflow, name: 'ETD Workflow') }

    context '#initial_workflow_state' do
      it 'will create a state if one does not exist' do
        expect { subject.initial_workflow_state }
          .to change { subject.workflow_states.count }.by(1)
      end
    end
  end
end
