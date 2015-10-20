FactoryGirl.define do
  factory(:user) do
    email('alyssa@alyssa.com')
    password('alyssa')
  end

  factory(:question) do
    title('What is love?')
    content('Please explain in Spanish')
  end

  factory(:answer) do
    content('Something that hurts')
  end
end
