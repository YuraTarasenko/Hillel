require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    it 'creates new user with uniq email' do
      expect { create(:user) }.to change { User.count }.by(1)
    end

    it 'fails on the creation of user with same email' do
      expect { create(:user) }.to_not raise_exception
      expect { create(:user) }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end

  describe '.last_comments' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    before :each do
      4.times { create(:comment, user: user, post: post) }
    end

    it 'returns 3 comments by default' do
      expect(user.last_comments.count).to eq(3)
    end

    it 'returns other number of comments when specified' do
      number_of_comments = 2

      expect(user.last_comments(number_of_comments).count).to eq(number_of_comments)
    end

    it 'returns 3 or less comments for any user' do
      new_user = create(:user, email: 'other@mail.com')

      expect(new_user.last_comments.count).to be <= 3
    end
  end
end
