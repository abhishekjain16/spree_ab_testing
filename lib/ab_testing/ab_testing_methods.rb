module AbTesting
  module AbTestingMethod
    def self.included(klass)
      klass.class_eval do
        before_filter :fetch_experiments, :unless => lambda {|c| c.restricted_to_experiment? }
      end
    end
    def fetch_experiments
      @experiments_with_variation = Sree::Experiment.with_variations.where(:relative_path => request.path)
    end

    def restricted_to_experiment?
      controller_name == "spree/experiments" || controller_name == "spree/variations" || params[:no_show].present?
    end
  end
end