class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def index
    @top_links = Link.order(clicks: :desc).first(12)
    
    render :json => @top_links.to_json(:methods => :display_slug)
  end

  def show
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      if redirect_to @link.original_url
        @link.clicks += 1
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end

  def create
    @link = Link.find_or_create_by_original_url(link_params)

    respond_to do |format|
      format.json { render json: @link.to_json(:methods => :display_slug) }
    end
  end

  private
    def set_link
      @link = Link.find_by(slug: params[:slug])
    end

    def link_params
      params.require(:link).permit(:original_url)
    end
end