require 'niwa_textream/models/base_model'

module NiwaTextream
  class Thread < BaseModel
    attr_accessor :title, :num_comment, :last_updated
    @title
    @num_comment
    @last_updated

    def initialize(elem, title, num_comment, last_updated)
      @elem = elem
      @title = title
      @num_comment = num_comment
      @last_updated = last_updated
    end
  end
end