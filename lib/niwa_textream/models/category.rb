require 'base_model'

module NiwaTextream
  # Contains Category object.
  class Category < BaseModel
    # category name
    attr_accessor :name, :parent

    @@name = Nil
    # parent's category object. top category: Nil
    @@parent = Nil

    def initialize
    end
  end
end