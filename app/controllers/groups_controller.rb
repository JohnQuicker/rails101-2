class GroupsController < ApplicationController
# Define the talk groups indexing function, which the main page shows.
  def index
    @groups = Group.all
  end
#
#
# Define the new action, which is a model(group)'s method.
  def new
    @group = Group.new
  end

# Define the create(submit提交) action, which is a model's methods with parameters.
  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to groups_path
  end

private

# Define the params format, whoes parameters were get from the new_html page.
def group_params
  params.require(:group).permit(:title, :description)
end
#
#
# Define the group title click action.
def shows
  @group = Group.find(params[:id])
end

end
