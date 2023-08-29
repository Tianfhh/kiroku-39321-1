require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '新規投稿' do

    before do
      @entry = FactoryBot.build(:entry)
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば投稿できる' do
        expect(@entry).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it '記録写真が添付されていない場合投稿できない' do
        @entry.image = nil
        @entry.valid?
        expect(@entry.errors.full_messages).to include "記録写真を入力してください"
      end

      it 'タイトルが空の場合投稿できない' do
        @entry.title = ''
        @entry.valid?
        expect(@entry.errors.full_messages).to include "タイトルを入力してください"
      end

      it '記録内容が空の場合投稿できない' do
        @entry.text = ''
        @entry.valid?
        expect(@entry.errors.full_messages).to include "記録内容を入力してください"
      end

    end
  end

end