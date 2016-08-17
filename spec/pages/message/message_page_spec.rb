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
      expect(@messages.first.posted_at.year).to be Time.now.year
    end

    it 'have prev page link' do
      expect(@messagePage.message_header.prevPageAvail?).to be_truthy
    end

    it 'have no next page link' do
      expect(@messagePage.message_header.nextPageAvail?).to be_falsey
    end

    it 'can go to prev page and next page link will appear' do
      @messagePage = @messagePage.message_header.clickPrevButton
      # the prev link will appear
      expect(@messagePage.message_header.nextBtn).not_to be_nil
      # the next link will appear
      expect(@messagePage.message_header.prevBtn).not_to be_nil
      @messagePage = @messagePage.message_header.clickPrevButton
    end

    it "can go to prev page and the first post's date is older than the 1st page's last post" do
      first_last_post = @messagePage.messages.last
      @messagePage = @messagePage.message_header.clickPrevButton
      # the prev link will appear
      prev_first_post = @messagePage.messages.first
      # the message is newest order
      expect(prev_first_post.posted_at).to be <= first_last_post.posted_at
    end
  end
end
