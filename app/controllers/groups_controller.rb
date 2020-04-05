class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    # binding.pry
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def updaete
    @group = Group.find(params[:id])
    if @gorup.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
