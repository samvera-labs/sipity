module Sipity
  # Represents a "comment" placed by the given :agent in regards to the give :entity
  class Comment < ApplicationRecord
    self.table_name = 'sipity_comments'

    belongs_to :agent, class_name: 'Sipity::Agent'
    belongs_to :entity, class_name: 'Sipity::Entity'

    def name_of_commentor
      agent.name
    end
  end
end
