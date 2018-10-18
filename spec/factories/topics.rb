FactoryBot.define do
  factory :topic do
    title { "Dungeons" }
    slug { "dungeons" }
  end

  factory :second_topic, class: 'Topic' do
    title { "Dragons" }
    slug { "dragons" }
  end
end
