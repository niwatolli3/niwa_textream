require 'niwa_textream/models/base_model'

module NiwaTextream
  # Contains Category object.
  class Category < BaseModel
    # category name
    attr_accessor :name, :parent

    @@name = nil
    # parent's category object. top category: Nil
    @@parent = nil

    def initialize
    end
  end
end