class GroupsController < ApplicationController
# Define the talk groups indexing function, which the main page shows.
  def index
    @groups = Group.all
  end

# Define the new action, which is a model(group)'s method.
  def new
    @group = Group.new
  end



end
