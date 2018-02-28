module Sipity
  # A named workflow for processing an entity. Originally I had thought of
  # calling this a Type, but once I extracted the Processing submodule,
  # type felt to much of a noun, not conveying potentiality. Workflow
  # conveys "things will happen" because of this.
  class Workflow < ActiveRecord::Base
    self.table_name = 'sipity_workflows'

    has_many :entities, dependent: :destroy, class_name: 'Sipity::Entity'
    has_many :workflow_states, dependent: :destroy, class_name: 'Sipity::WorkflowState'
    has_many :workflow_actions, dependent: :destroy, class_name: 'Sipity::WorkflowAction'
    has_many :workflow_roles, dependent: :destroy, class_name: 'Sipity::WorkflowRole'

    DEFAULT_INITIAL_WORKFLOW_STATE = 'new'.freeze

    def initial_workflow_state
      workflow_states.find_or_create_by!(name: DEFAULT_INITIAL_WORKFLOW_STATE)
    end

    # Grant a workflow responsibility to a set of agents and remove it from any
    # agents who currently have the workflow responsibility, but are not in the
    # provided list
    # @param [Sipity::Role] role the role to grant
    # @param [Array<Sipity::Agent>] agents the agents to grant it to
    def update_responsibilities(role:, agents:)
      add_workflow_responsibilities(role, agents)
      remove_workflow_responsibilities(role, agents)
    end

    private

    # Give workflow responsibilites to the provided agents for the given role
    # @param [Sipity::Role] role
    # @param [Array<Sipity::Agent>] agents
    def add_workflow_responsibilities(role, agents)
      Sipity::PermissionGenerator.call(roles: role,
                                       workflow: self,
                                       agents: agents)
    end

    # Find any workflow_responsibilities held by agents not in the allowed_agents
    # and remove them
    # @param [Sipity::Role] role
    # @param [Array<Sipity::Agent>] allowed_agents
    def remove_workflow_responsibilities(role, allowed_agents)
      wf_role = Sipity::WorkflowRole.find_by(workflow: self, role_id: role)
      wf_role.workflow_responsibilities.where.not(agent: allowed_agents).destroy_all
    end
  end
end
