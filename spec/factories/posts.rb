FactoryBot.define do
  factory :post do
    title { "My Great Post" }
    content { "Amazing Content" }
    user {}
    topic {}
  end

  factory :second_post, class: 'Post' do
    title { "Another Guide" }
    content { "Killer post" }
    user {}
    topic {}
  end
end
