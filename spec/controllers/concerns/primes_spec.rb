require 'rails_helper'

describe 'Primes' do
  it "return first 10 prime numbers" do
    expect(Primes.n_primes(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end

  it "contains 43 in first 15 prime numbers" do
    expect(Primes.n_primes(15)).to include(43)
  end

  it "contains 1091 in first 500 prime numbers" do
    expect(Primes.n_primes(500)).to include(1091)
  end
end