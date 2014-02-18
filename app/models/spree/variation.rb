module Spree
  class Variation < ActiveRecord::Base
    belongs_to :experiment

    before_save :strip_new_line, :if => :data_changed?

    def strip_new_line
      self.data.squish!
    end

    def self.fetch_with_probablity_and_percentage
      hash = {}
      all.each do |v|
        hash[v] = v.render_percentage
      end
      picker(hash)
    end

    def self.picker(options)
      current, max = 0, options.values.inject(:+)
      random_value = rand(max) + 1
      options.each do |key,val|
         current += val
         return key if random_value <= current
      end
    end
  end
end