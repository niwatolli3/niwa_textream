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

    it 'have no prev page link' do
      expect(@threadPage.prev_page_elem).to be_nil
    end

    it 'have next page link' do
      expect(@threadPage.next_page_elem).not_to be_nil
    end

    it 'can go to next page and prev page link will appear' do
      @threadPage = @threadPage.clickNextPage
      # the prev link will appear
      expect(@threadPage.prev_page_elem).not_to be_nil
      # the next link will appear
      expect(@threadPage.next_page_elem).not_to be_nil
      @threadPage = @threadPage.clickPrevPage
    end

    it "can go to next page and the first post's date is older than the 1st page's last post" do
      first_last_post = @threads.last
      @threadPage = @threadPage.clickNextPage
      next_first_post = @threadPage.threads.first
      expect(next_first_post.last_updated).to be <= first_last_post.last_updated
    end
  end
end
