# class groupController < ApplicationController
class GroupsController < ApplicationController

before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]
  def index
    # @group = Group.all
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def edit
    # @group = Group.edit(params[:id])
  end

  def show
    # @group = Group.show(params[:id])
  end

  def create
    # @group = Group.create(groups_params)
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
      # render new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Update Success'
    else
      # render edit
      render :edit
    end
  end

  def destroy
    find_group_and_check_permission
    @group.destroy
    # redirect_to groups_path
    redirect_to groups_path, alert: 'Group deleted'
  end

  private

  def find_group_and_check_permission
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to root_path, alert: 'You have no permission.'
    end
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end



# class GroupsController < ApplicationController
#
# # Define the talk groups indexing function, which the main page shows.
#   def index
#     @groups = Group.all
#   end
#
# # Define the new action, which is a model(group)'s method.
#   def new
#     @group = Group.new
#   end
#
# # Define the create(submit提交) action, which is a model's methods with parameters.
#   def create
#     @group = Group.new(group_params)
#     @group.save
#     redirect_to groups_path
#   end
#
# # Define the group title click action.
#   def show
#     @group = Group.find(params[:id])
#   end
#
# # Define the group title click action.
#   def edit
#     @group = Group.find(params[:id])
#   end
#
# # Define delete button's action.
#   def destroy
#     @group = Group.find(params[:id])
#     @group.destroy
#     redirect_to groups_path, flash[:alert] = "讨论区被删除了"
#   end
#
#   private
#
# # Define the params format, whoes parameters were get from the new_html page.
#   def group_params
#     params.require(:group).permit(:title, :description)
#   end
#
# end
