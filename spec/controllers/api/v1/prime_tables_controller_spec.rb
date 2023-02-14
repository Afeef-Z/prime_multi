# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PrimeTablesController, type: :controller do
  describe "GET #index" do
    context "when input is valid" do
      let(:dimension) { 10 }
      let(:valid_primes) { Primes.n_primes(dimension) }

      it "returns the correct n prime numbers" do
        get :index, params: { dimension: dimension }

        data = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(response.content_type).to include('application/json') 
        expect(data.length).to eq(dimension)
        expect(data).to eq(valid_primes)
      end
    end

    context "when input is invalid" do
      let(:negative_dimension) { -1 } 
      let(:chars_dimension) { "test" }
      let(:valid_primes) { [] }
  
      it "returns empty array when negative value is entered" do
        get :index, params: { dimension: negative_dimension }

        data = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(response.content_type).to include('application/json')
        expect(data.length).to eq(0)
        expect(data).to eq(valid_primes)
      end
  
      it "returns empty array when invalid characters are entered" do
        get :index, params: { dimension: chars_dimension }

        data = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(response.content_type).to include('application/json') ###
        expect(data.length).to eq(0)
        expect(data).to eq(valid_primes)
      end
    end
  end
end 