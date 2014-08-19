require 'spec_helper'

describe 'Province' do
  it 'initializes with a hash' do
    new_province = Province.new({:name => 'Lowbuck Province'})
    expect(new_province).to be_an_instance_of Province
  end

  it 'lets you read the name' do
    new_province = Province.new({:name => 'Lowbuck Province'})
    expect(new_province.name).to eq 'Lowbuck Province'
  end

  describe '.all' do
    it 'starts as an empty array' do
      expect(Province.all).to eq []
    end

    it 'returns all provincess' do
      new_provinces1 = Province.new({:name => 'Lowbuck Province'})
      new_provinces2 = Province.new({:name => 'Castle Blackrock'})
      new_provinces1.save
      new_provinces2.save
      expect(Province.all).to eq [new_provinces1, new_provinces2]
    end
  end

  describe '.find' do
    it 'returns a province when given an id' do
      new_province = Province.new({:name => 'Greenhaven'})
      new_province.save
      expect(Province.find(new_province.id)).to eq new_province
    end
  end

  describe 'save' do
    it 'saves a province' do
      new_province = Province.new({:name => 'Castle Blackrock'})
      new_province.save
      expect(Province.all).to eq [new_province]
    end

    it 'adds an id' do
      new_province = Province.new({:name => 'Castle Blackrock'})
      new_province.save
      expect(Province.all[0].id).to eq new_province.id
    end
  end

  describe 'remove' do
    it 'deletes a province' do
      new_province = Province.new({:name => 'Castle Blackrock'})
      new_province.save
      new_province.remove
      expect(Province.all).to eq []
    end

    it 'only deletes the province remove is called on' do
      new_province1 = Province.new({:name => 'Frozen Fjord'})
      new_province1.save
      new_province2 = Province.new({:name => 'Splinter Hill'})
      new_province2.save
      new_province1.remove
      expect(Province.all).to eq [new_province2]
    end
  end
end