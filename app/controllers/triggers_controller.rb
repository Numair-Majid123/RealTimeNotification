# frozen_string_literal: true

# app/controllers/triggers_controller.rb
class TriggersController < ApplicationController
  def create
    @trigger = Trigger.create!(trigger_params)
    flash[:notice] = I18n.t('controllers.triggers.create.success_message')

    render turbo_stream: [
      turbo_stream.append(:flash, partial: 'shared/flash', locals: { flash: }),
      turbo_stream.replace('new_trigger', partial: 'shared/trigger_form')
    ]
  rescue StandardError => e
    flash[:alert] = e.message.split(', ') || I18n.t('controllers.triggers.create.error_message')

    render turbo_stream: turbo_stream.append(:flash, partial: 'shared/flash', locals: { flash: }),
           status: :unprocessable_entity
  end

  private

  def trigger_params
    params.require(:trigger).permit(:to, :body)
  end
end
