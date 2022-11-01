module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_results(filtering_params)
      results = all
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end

end
