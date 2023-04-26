class SearchController < ApplicationController
  def index
    @query = Assignment.ransack(params[:q])
    @assignments = @query.result(destinct: true)
  end
end
