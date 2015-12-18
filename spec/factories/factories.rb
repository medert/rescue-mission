FactoryGirl.define do
  factory :question do
    title 'This is a factory girl driven question title. Use at your own risk. What is factory girl?'
    description 'loreamd aoidjflokjlkadkjfal diljaflkadj fladskjf ;lkasdjfklklaesjrekjfkaljflkd jflaskdjf alsdkfj dskl;fj alsd;f ljadsf;kjads;fkadslfj lksdfj aklsd fjl;ask fjasdlkfjasdklfj dslk;af jds;aklf jdsalf jadkslfjasd fj;dsaklfj '
    creator_id 1
  end

  factory :answer do
    description "This is an answer for a relevant question"
    question_id
    user_id
  end
end
