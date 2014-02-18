module Spree
  class ExperimentsController < StoreController
    before_filter :load_experiment, :only => [:show, :edit, :update]
    before_filter :load_variations, :only => :show

    def index
      @experiments = Spree::Experiment.all
    end

    def new
      @experiment = Spree::Experiment.new
    end

    def edit
    end

    def update
      if @experiment.update_attributes(experiment_params)
        redirect_to @experiment
      else
        render :edit
      end    
    end

    def create
      @experiment = Spree::Experiment.new(experiment_params)
      if @experiment.save
        redirect_to @experiment
      else
        render :new
      end
    end

    def show
    end

    private

    def load_variations
      @variations = @experiment.variations
    end

    def load_experiment
      redirect_to experiments_path unless @experiment = Spree::Experiment.where(:id => params[:id]).first
    end

    def experiment_params
      params.require(:experiment).permit([:name, :relative_path, :selector, :success_selector, :success_method])
    end

    def generate_data_for_routes_and_controllers
      @paths = ::RouteMethods.get_paths    
    end
  end
end