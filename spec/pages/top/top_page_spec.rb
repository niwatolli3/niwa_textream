require "niwa_textream/pages/top/top_page"

describe 'TopPage' do
  before do
    @topPage = NiwaTextream::TopPage.new(Mechanize.new)
  end

  describe 'category' do
    it 'contains one more object' do
      expect(@topPage.categories.count).to be >= 1
    end
    it 'contains ニュース速報（Yahoo!ニュース）' do
      expect(@topPage.categories.has_key?("ニュース速報（Yahoo!ニュース）")).to be_truthy
    end

    it 'contains 31 top categories' do
      expect(@topPage.categories.count).to be 31
    end
  end
end