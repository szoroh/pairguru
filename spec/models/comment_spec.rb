require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:title) { 'Beautiful movie' }
  let(:body)  { 'Would gladly recommand' }
  let(:movie) { Movie.new(title: "Hiroshima, My Love") }
  let(:user)  { User.new(email: "email@platform.com", password: "mybeloveddogsname") }

  subject { Comment.new(title: title, body: body, movie_id: movie, user_id: user ) }

  context 'with incorrect data' do
    it 'is invalid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
  end

    it 'is invalid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without movie_id' do
      subject.movie_id = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid withoud user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
