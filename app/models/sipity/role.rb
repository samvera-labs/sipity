module Sipity
  # A role is a responsibility to do things. That is to take actions. It is
  # easy to conflate a person's role with the groups to which they belong.
  # A group is a set of people. The association of group with role
  # indicates that the set of people have the same responsibilities.
  #
  # By separating Group and Role, we expose a more rich system in which we
  # can talk about group membership separate from the group's
  # responsibility.
  #
  # Another way to think of it is that a Group is a marco that expands to
  # represent people. A Role is a macro that expands to represent
  # responsibilities. In keeping them separate we can model more rich
  # relationships.
  #
  # @note Roles should be verbs. They are what you do.
  #
  # @note This model representes the "roles" that users of the system can
  #   have. It is not the "role" that they had in relation to the scholarly
  #   work that is being deposited (i.e. co-author on a paper).
  #
  # @see Sipity::Agent
  class Role < ApplicationRecord
    self.table_name = 'sipity_roles'

    has_many :workflow_roles,
             dependent: :destroy,
             class_name: 'Sipity::WorkflowRole'

    has_many :email_recipients,
             dependent: :destroy,
             foreign_key: :role_id,
             class_name: 'Sipity::NotificationRecipient'

    def self.[](name)
      find_or_create_by!(name: name.to_s)
    end

    def to_s
      name
    end
  end
end
