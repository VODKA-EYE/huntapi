# frozen_string_literal: true

class ToolController < ApplicationController
  before_action :find_tool, only: %i[update destroy]

  def all
    tools = Tool.all.order(:name)
    render json: tools
  end

  def create
    if tool_params.present?
      tool = Tool.new(tool_params)
      if tool.save
        render json: { message: 'Tool created' }
      else
        render json: { error: true, message: tool.errors.full_messages }
        end
    else
      render json: { error: true, message: 'Empty field' }, status: 400
      end
  end

  def destroy
    @tool.delete
  end

  def update
    @tool.update(tool_params)
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :cost, :usages, :image_url)
  end

  def find_tool
    @tool ||= Tool.find_by_id(params[:id])
    render json: { error: true, message: 'Tool not found' } unless @tool
  end
end
