Spree::StoreController.class_eval do
  before_filter :fetch_experiments, :unless => lambda {|c| c.restricted_to_experiment? }

  def fetch_experiments
    @experiments_with_variation = Experiment.with_variations.where(:relative_path => request.path)
  end

  def restricted_to_experiment?
    controller_name == "experiments" || controller_name == "variations" || params[:no_show].present?
  end

end