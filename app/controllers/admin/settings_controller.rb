# frozen_string_literal: true

class Admin::SettingsController < Admin::ApplicationController
  before_action :set_setting, only: [:edit, :update]

  def index
  end

  def edit
  end

  def show
  end

  def update
    if @setting.value != setting_param[:value]
      @setting.value = setting_param[:value]
      @setting.save
      redirect_to admin_settings_path, notice: "保存成功."
    else
      redirect_to admin_settings_path
    end
  end

  def set_setting
    @setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
  end

  private

  def setting_param
    params[:setting].permit!
  end
end
