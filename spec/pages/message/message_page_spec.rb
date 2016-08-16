require "niwa_textream/pages/top/top_page"

describe 'MessagePage' do
  before :all do
    mecha = Mechanize.new
    NiwaTextream::TopPage.goTo(mecha)
    @topPage = NiwaTextream::TopPage.new(mecha)
    cat_name = '野球実況'
    @categoryPage = @topPage.clickCategory(cat_name)
    @threadPage = @categoryPage.clickCategory('副音声')
    @threads = @threadPage.threads
    @messagePage = @threadPage.clickThread(@threads.first)
    @messages = @messagePage.messages
  end

  describe 'message' do
    it 'should have at least one' do
      expect(@messages.count).to be >= 1
    end

    it 'contains body' do
      expect(@messages.first.body).not_to be ""
    end

    it 'contains correctly posted_at(current year)' do
      expect(@message.first.posted_at.year).to be Time.now.year
    end
  end
end
