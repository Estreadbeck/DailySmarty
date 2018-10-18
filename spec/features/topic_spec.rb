require 'rails_helper'

describe 'navigation' do 
  describe 'index' do
    before do
      @topic = FactoryBot.build_stubbed(:topic)
      @topic2 = FactoryBot.build_stubbed(:second_topic)
      visit topics_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'renders the list of topics' do
      expect(page).to have_content(/Dungeons|Dragons/)
    end

    it 'each topic links to its show page' do
      expect(page).to have_link(@topic.title, href: topic_post_path(@topic))
    end
  end

  describe 'show' do
    before do
      @topic = FactoryBot.build_stubbed(:topic)
      visit topic_path(@topic)
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'should display the topic title' do
      expect(page).to have_css('h1', text: "#{@topic.title}")
    end

    it 'should have a url that matches the custom url slug' do
      expect(current_path).to have_content("#{@topic.slug}")
    end
  end

  describe 'new' do
    before do
      visit new_topic_path
    end

    it 'can be reached successfully when navigating to the /new path' do
      expect(page.status_code).to eq(200)
    end

    it 'allows users to create a new topic from the /new page'do
      fill_in 'topic[title]', with: "Star Trek"
      click_on "Save"
    end
  end

  describe 'edit' do
    before do
      @topic = FactoryBot.build_stubbed(:topic)
      visit edit_topic_path(@topic)
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'allows users to update an existing topic from the /edit page' do
      fill_in 'topic[title]', with: "Doom 2016"

      click_on "Save"

      expect(page).to have_content('Doom 2016')
    end
  end
end