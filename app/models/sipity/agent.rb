module Sipity
  # A proxy for something that can take an action.
  #
  # * A User can be an agent
  # * A Group can be an agent (though Group is outside the scope of this system)
  class Agent < ApplicationRecord
    self.table_name = 'sipity_agents'

    ENTITY_LEVEL_AGENT_RELATIONSHIP = 'entity_level'.freeze
    WORKFLOW_LEVEL_AGENT_RELATIONSHIP = 'workflow_level'.freeze

    has_many :workflow_responsibilities, dependent: :destroy, class_name: 'Sipity::WorkflowResponsibility'
    has_many :entity_specific_responsibilities, dependent: :destroy, class_name: 'Sipity::EntitySpecificResponsibility'

    has_many :comments,
             foreign_key: :agent_id,
             dependent: :destroy,
             class_name: 'Sipity::Comment'

    #   def proxy_for=(target)
    #     self.proxy_for_id = target.id
    #     self.proxy_for_type = target.class.name
    #   end
    #
    #   def proxy_for
    #     @proxy_for ||= proxy_for_type.constantize.find(proxy_for_id)
    # end

    def name
      agent_resolver.resolve(proxy_for_global_id).name
    end
  end
end
