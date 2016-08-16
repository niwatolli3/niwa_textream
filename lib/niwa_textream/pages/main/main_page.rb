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

    # go to page by using mechanize
    def self.goTo(mechanize)
      @page = mechanize.get(@@url)
    end

    def self.url
      @@url
    end
  end
end