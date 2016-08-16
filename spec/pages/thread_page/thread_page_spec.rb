require "niwa_textream/pages/top/top_page"

describe 'ThreadPage' do
  before :all do
    mecha = Mechanize.new
    NiwaTextream::TopPage.goTo(mecha)
    @topPage = NiwaTextream::TopPage.new(mecha)
    cat_name = '野球実況'
    @categoryPage = @topPage.clickCategory(cat_name)
    @threadPage = @categoryPage.clickCategory('副音声')
    @threads = @threadPage.threads
  end

  describe 'thread' do
    it 'have more than 1 threads' do
      expect(@threads.count).to be >= 1
    end

    it 'have title (not empty' do
      expect(@threads[0].title).not_to be ""
    end

    it 'have more than 1 comment' do
      expect(@threads[0].num_comment).to be >= 1
    end

    it 'have last updated time (DateTime)' do
      expect(@threads[0].last_updated).to be_kind_of(DateTime)
    end

    it 'have elem' do
      expect(@threads[0].elem).not_to be nil
    end
  end
end
