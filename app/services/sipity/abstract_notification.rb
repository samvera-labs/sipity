module Sipity
  # @abstract A notification that happens when a state transition occurs. Create a NotificationService to handle the notification.
  # @example
  #   module Sipity
  #     class LocalApprovedNotification < AbstractNotification
  #       private
  #
  #         def message_type
  #           "approved"
  #         end
  #
  #         # Add the user who initiated this action to the list of users being notified
  #         def users_to_notify
  #           super << user
  #         end
  #     end
  #   end
  class AbstractNotification
    include ActionView::Helpers::UrlHelper

    def self.send_notification(entity:, comment:, user:, recipients:)
      new(entity, comment, user, recipients).call
    end

    attr_reader :comment, :user, :recipients

    # @param [Sipity::Entity] entity - the Sipity::Entity that is a proxy for the relevant Hyrax work
    # @param [#comment] comment - the comment associated with the action being taken, could be a Sipity::Comment, or anything that responds to a #comment method
    # @param [Hyrax::User] user - the user who has performed the relevant action
    # @param [Hash] recipients - a hash with keys "to" and (optionally) "cc"
    # @option recipients [Array<Hyrax::User>] :to a list of users to which to send the notification
    # @option recipients [Array<Hyrax::User>] :cc a list of users to which to copy on the notification
    def initialize(entity, comment, user, recipients)
      @comment = comment.respond_to?(:comment) ? comment.comment.to_s : ''
      # Convert to hash with indifferent access to allow both string and symbol keys
      @recipients = recipients.with_indifferent_access
      @user = user
      @entity = entity
    end

    def call
      users_to_notify.uniq.each do |recipient|
        Hyrax::MessengerService.deliver(user, recipient, entity.proxy_for_global_id, message_type)
      end
    end

    private

      def message_type
        raise NotImplementedError, "Implement #message_type in a child class"
      end

      def users_to_notify
        recipients.fetch(:to, []) + recipients.fetch(:cc, [])
      end
  end
end
