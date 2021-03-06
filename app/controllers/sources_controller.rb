class SourcesController < ApplicationController

  def index
    @essay = Essay.find(params[:essay_id])
    @sources = @essay.sources.sort_by{|work| work.citation}
  end

  def show
    @essay = Essay.find(params[:essay_id])
    @source = @essay.sources.find(params[:id])
  end

  def new
    @essay = Essay.find(params[:essay_id])
    @source = @essay.sources.new
  end

  def create
    @essay = Essay.find(params[:essay_id])
    @source = @essay.sources.new(source_params)
    if @source.save
      redirect_to essay_source_path(@essay, @source)
    else
      render 'new'
    end
  end

  def edit
    @essay = Essay.find(params[:essay_id])
    @source = @essay.sources.find(params[:id])
  end

  def update
    @essay = Essay.find(params[:essay_id])
    @source = @essay.sources.find(params[:id])
    if @source.update(source_params)
      redirect_to essay_source_path(@essay, @source)
    else
      render 'edit'
    end
  end

  def destroy
    @essay = Essay.find(params[:essay_id])
    @source = @essay.sources.find(params[:id])
    @source.destroy

    redirect_to essay_path(@essay)
  end

  private
    def source_params
      params.require(:source).permit(:title, :citation, :notes, :url)
    end
end
