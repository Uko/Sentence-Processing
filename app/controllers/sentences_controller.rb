class SentencesController < ApplicationController
  def new
		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sentence }
    end
  end


  def show
		if(params.has_key? :sentence)
			@sentence=params[:sentence]
			@graph=Sentence.make_graph_of @sentence
		else
			redirect_to({:action => 'new'}, :notice => 'Can\'t show a graph for nothing :)')
		end
  end
end
