class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = Group.where(user: current_user).order(created_at: :desc).includes(:entity_groups)
    @groups.each { |group| group.total = group.entity_groups.joins(:entity).sum(:amount) }
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.name = params[:group][:name].capitalize
    @group.user = current_user

    begin
      @group.save
      redirect_to groups_path, notice: 'Group created successfully'
    rescue StandardError
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
