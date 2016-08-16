require "niwa_textream/version"
require "mechanize"

%w[ models/category pages/top/top_page ].each do |file|
  require "niwa_textream/#{ file }"
end

module NiwaTextream
  def self.test
    TopPage.new(Mechanize.new)
    TopPage.url
  end
end