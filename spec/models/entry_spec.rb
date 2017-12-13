require 'rails_helper'
RSpec.describe 'entry' do

  context 'when an entry is created' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @entry = Entry.create!(time: "2018-07-01 10:05:00", systolic: 120, diastolic: 60, notes: 'I was stressed today', user: @user)
    end

    it 'has a systolic value' do
      expect(@entry.systolic).to eq(120)
    end
    it 'has a diastolic value' do
      expect(@entry.diastolic).to eq(60)
    end
    it 'has a time' do
      expect(@entry.time).to eq '2018-07-01 10:05:00'
    end
  end

  context 'creating an entry with missing information' do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'is missing  a systolic value' do
      entry = Entry.new(time: "2018-07-01 10:05:00", diastolic: 60, notes: 'I was stressed today', user: @user)
      entry.save

      expect(Entry.all.length).to eq(0)
    end

    it 'is missing a diastolic value' do
      entry = Entry.new(time: "2018-07-01 10:05:00", systolic: 120, notes: 'I was stressed today', user: @user)
      entry.save

      expect(Entry.all.length).to eq(0)
    end

    it 'is missing a time' do
      entry = Entry.new(systolic: 120, diastolic: 60, notes: 'I was stressed today', user: @user)
      entry.save

      expect(Entry.all.length).to eq(0)
    end
  end
end
