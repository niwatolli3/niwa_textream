require 'niwa_textream/models/base_model'

module NiwaTextream
  # Contains Category object.
  class Category < BaseModel
    # category name
    attr_accessor :name, :parent, :num_thread

    @name = nil
    # parent's category object. top category: Nil
    @parent = nil

    @num_thread = -1

    def initialize
    end
  end
end