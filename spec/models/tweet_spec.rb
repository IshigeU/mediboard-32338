require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'タイトルとテキストがあれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'タイトルとテキストが空では投稿できない' do
        @tweet.text = ''
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Titleを入力してください", "Textを入力してください")
      end
      it 'タイトルがないと投稿できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Titleを入力してください")
      end
      it 'テキストがないと投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Textを入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end