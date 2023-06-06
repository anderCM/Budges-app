class EntitiesController < ApplicationController
  def index
    @group_id = params[:group_id]
    @entities = Entity.joins(:entity_groups).where(author: current_user,
                                                   entity_groups: { group_id: @group_id }).order(created_at: :desc)
  end

  def new
    @entity = Entity.new
    @group_id = params[:group_id]
  end

  def create
    @group_id = params[:group_id]
    @entity = Entity.new(entity_params)
    @entity.author = current_user

    @entity.save
    @entity_group = EntityGroup.new(entity: @entity, group_id: @group_id)
    begin
      @entity_group.save
      redirect_to group_entities_path(@group_id), notice: 'Entity created successfully'
    rescue StandardError
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
