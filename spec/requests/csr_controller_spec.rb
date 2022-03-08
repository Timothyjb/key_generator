require 'spec_helper'
require 'rspec'
require 'rack/test'

describe CsrController, type: :controller do

  def app
    described_class
  end

  describe "/csr/new" do
    it "successfully loads page" do
      get "/csr/new"

      expect(last_response.status).to eq 200
    end
  end

  describe "/csr/create" do
    it "successfully loads page" do
      params = {
        country: "US",
        state: "TX",
        city: "Austin",
        organization: "TimboBaggins, inc",
        department: "TimboBaggins, inc",
        common_name: "TimboBaggins, inc",
        email: "timbobaggins@onering.com"
      }

      post "/csr/create", params

      expect(last_response.status).to eq 200
    end
  end

end
