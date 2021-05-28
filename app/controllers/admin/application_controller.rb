class Admin::ApplicationController < ApplicationController
  layout 'admin'
  include Admin::ResourceContent
  include Pundit
  include Pagy::Backend  

  after_action { pagy_headers_merge(@pagy) if @pagy }
  
  protect_from_forgery
  before_action :require_login
  helper_method :attributes, :resource, :resource_class, :show_attributes


  before_action :set_raven_context

  private

  def set_raven_context
    Raven.user_context(id: current_user.id) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end