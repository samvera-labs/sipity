module Sipity
  class WorkflowStateActionPermission < ApplicationRecord
    self.table_name = 'sipity_workflow_state_action_permissions'
    belongs_to :workflow_role, class_name: 'Sipity::WorkflowRole'
    belongs_to :workflow_state_action, class_name: 'Sipity::WorkflowStateAction'
  end
end
