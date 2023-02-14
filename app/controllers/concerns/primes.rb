# frozen_string_literal: true

module Primes
  extend ActiveSupport::Concern

  def self.generate_primes(n)
    primes = []
    is_prime = [false, false] + Array.new(n - 1, true)
    (2..n).each do |i|
      next unless is_prime[i]
      primes << i
      (i*i..n).step(i).each { |j| is_prime[j] = false }
    end
    primes
  end
  
  def self.n_primes(dimension)
    primes = generate_primes(dimension)
    return primes if dimension <= primes.size
    i = primes.last + 1
    while primes.size < dimension
      primes << i if is_prime(i, primes)
      i += 1
    end
    primes
  end
  
  def self.is_prime(n, primes)
    sqrt_n = Math.sqrt(n).to_i
    primes.each do |p|
      return true if p > sqrt_n
      return false if n % p == 0
    end
    true
  end
end