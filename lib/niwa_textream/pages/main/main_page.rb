module NiwaTextream
  class MainPage
    attr_accessor :url

    @@url = nil
    # mechanize object
    @mechanize = nil
    # header object
    @header = nil
    # body object
    @body = nil

    @page = nil

    def initialize(mechanize)
      @mechanize = mechanize
    end
  end
end