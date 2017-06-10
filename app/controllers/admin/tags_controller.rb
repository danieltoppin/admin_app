class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
  end
    redirect_to new_admin_tag_url, notice: 'Tag was sucessfully created'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tags_params
      redirect_to new_admin_tag_url, notice: 'Sucessfully updated tag'
    else
      flash[:alert] = 'There was a problem updating tag'
    end
  end

  def show
  end

  def destroy
  end

  private

  def tags_params
    params.require(:tag).permit(:id, :name)
  end
end
