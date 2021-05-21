class ListsController < ApplicationController
  before_action :set_list, only: [ :show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def edit; end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
