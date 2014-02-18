module Spree
  class VariationsController < StoreController

    before_filter :load_experiment, :only => [:show, :create, :new, :edit, :update]
    before_filter :load_variation, :only => [:show, :edit, :update]
    # before_filter :load_default_html, :only => :new

    def new
      @variation = @experiment.variations.build
    end

    def create
      @variation = @experiment.variations.build(variations_params)
      if @variation.save
        redirect_to [@experiment, @variation]
      else
        render :new
      end
    end

    def show
    end

    def update
      if @variation.update_attributes(variations_params)
        redirect_to [@experiment, @variation]
      else
        render :edit
      end
    end

    def increment
      @variation = Spree::Variation.where(:id => params[:v]).first
      @variation.increment!(:success_count)
      render :text => "Success!"
    end

    private

    # def get_controller_and_action
    #   Rails.application.routes.recognize_path(@experiment.relative_path)
    # end

    # def load_default_html
    #   # response = ::HTTParty.get("#{root_url}#{@experiment.relative_path.sub('/', '')}")
    #   # response = ::HTTParty.get("http://twitter.com/statuses/public_timeline.json")
    #   # Rails.logger.info("#{root_url}#{@experiment.relative_path.sub('/', '')}")
    #   # Rails.logger.info(response)
    #   # params = get_controller_and_action
    #   # @html_data = render_to_string("#{params[:controller]}/#{params[:action]}", :layout => false)
    # end

    def load_experiment
      redirect_to experiments_path unless @experiment = Spree::Experiment.where(:id => params[:experiment_id]).first
    end

    def load_variation
      redirect_to experiment_path(@experiment) unless @variation = Spree::Variation.where(:id => params[:id]).first
    end

    def variations_params
      params.require(:variation).permit([:name, :data, :render_percentage])
    end

  end
end