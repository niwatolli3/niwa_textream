require 'niwa_textream/models/base_model'

module NiwaTextream
  class Message < BaseModel
    attr_accessor :message_number, :body, :posted_at
    @message_number
    @body
    @posted_at

    def initialize(elem, body, posted_at)
      @elem = elem
      @body = body
      @posted_at = posted_at
    end
  end
end