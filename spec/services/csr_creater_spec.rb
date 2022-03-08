require 'spec_helper'
require 'openssl'

# require 'csr_creater.rb'



RSpec.describe CsrCreater, type: :service do

  it "can set and read country" do
    object = described_class.new
    object.country = "US"

    expect(object.country).to eq "US"
  end

  it "can set and read state" do
    object = described_class.new
    object.state = "TX"

    expect(object.state).to eq "TX"
  end

  it "can set and read city" do
    object = described_class.new
    object.city = "Austin"

    expect(object.city).to eq "Austin"
  end

  it "can set and read organization" do
    object = described_class.new
    object.organization = "TimboBaggins, inc"

    expect(object.organization).to eq "TimboBaggins, inc"
  end

  it "can set and read department" do
    object = described_class.new
    object.department = "TimboBaggins, inc"

    expect(object.department).to eq "TimboBaggins, inc"
  end

  it "can set and read common_name" do
    object = described_class.new
    object.common_name = "TimboBaggins, inc"

    expect(object.common_name).to eq "TimboBaggins, inc"
  end

  it "can set and read email" do
    object = described_class.new
    object.email = "timbobagins@onering.com"

    expect(object.email).to eq "timbobagins@onering.com"
  end

  describe "call" do
    before :each do
      @object = described_class.new
      @object.country = "US"
      @object.state = "TX"
      @object.city = "Austin"
      @object.organization = "TimboBaggins, inc"
      @object.department = "TimboBaggins, inc"
      @object.common_name = "TimboBaggins, inc"
      @object.email = "timbobagins@onering.com"

    end

    it "sets private_key" do
      @object.call

      expect(@object.private_key).to_not be_nil
    end

    it "sets csr" do
      @object.call

      expect(@object.csr).to_not be_nil
    end
  end

end
