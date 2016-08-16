require "niwa_textream/pages/top/top_page"

describe 'TopPage' do
  before do
    mecha = Mechanize.new
    NiwaTextream::TopPage.goTo(mecha)
    @topPage = NiwaTextream::TopPage.new(mecha)
    cat_name = '野球実況'
    @categoryPage = @topPage.clickCategory(cat_name)
  end

  describe 'category' do
    it 'can move to CategoryPage' do
      expect(@categoryPage).to be_kind_of(NiwaTextream::CategoryPage)
    end

    it 'can get categories (child category of 野球実況)' do
      cats = @categoryPage.categories
      expect(cats.count).to be >= 1
    end

    it 'can get 4 categories (child category of 野球実況)' do
      cats = @categoryPage.categories
      # プロ野球公式戦、プロ野球オープン戦、副音声、世界野球プレミア12
      expect(cats.count).to be 4
    end

    it 'can get exact name categories (child category of 野球実況)' do
      cats = @categoryPage.categories

      expect(cats.has_key?('プロ野球公式戦')).to be_truthy
      expect(cats.has_key?('プロ野球オープン戦')).to be_truthy
      expect(cats.has_key?('副音声')).to be_truthy
      expect(cats.has_key?('世界野球プレミア12')).to be_truthy
    end
  end
end
