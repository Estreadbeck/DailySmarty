require 'rails_helper'

describe 'post' do
  before do
    @topic = FactoryBot.build_stubbed(:topic)
  end

  describe 'nested route' do
    before do
      visit topic_posts_path(topic_id: @topic)
    end

    it 'has an index page properly nested under a topic' do
      expect(page.status_code).to eq(200)
    end

    it 'renders multiple posts' do
      expect(@topic.posts.count).to eq(2)
    end

    it 'has the post title' do
      expect(page).to have_content('My Great Post')
    end

    it 'has the post description' do
      expect(page).to have_content('Amazing content')
    end

    it 'has the post user name' do
      expect(page).to have_content(@topic.posts.last.user.username)
    end

    it 'has post links that point to post show pages' do
      expect(page).to have_link(@topic.posts.last.title, href: topic_post_path(topic_id: @topic, id: @topic.posts.last))
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'should allow a post to be created from the form page and redirect to the show page' do
      fill_in 'post[title]', with: "Xanathar"
      fill_in 'post[content]', with: "Guide to Everything"
      find_field("post[topic_id]").find("option[value='#{@topic.id}']").click

      click_on "Save"

      expect(page).to have_css("h1", text: "Xanathar")
    end

    xit 'should automatically have a topic selected if clicked on new post from the topic page' do
    end

    xit 'should have a user associated with the post' do
    end
  end
end