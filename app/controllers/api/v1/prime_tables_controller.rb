# frozen_string_literal: true

class Api::V1::PrimeTablesController < ApplicationController
  before_action :set_dimension, only: [:index]

  include Primes

  def index
    unless @dimension.positive?
      render json: [], status: :unprocessable_entity
    else
      render json: Primes.n_primes(@dimension), status: :ok
    end
  end

  private 

    def set_dimension
      @dimension = params.require(:dimension).to_i
    end
end
