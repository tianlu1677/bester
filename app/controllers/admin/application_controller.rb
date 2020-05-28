class Admin::ApplicationController < ApplicationController
  layout 'admin'
  include Admin::ResourceContent
  include Pundit
  
  protect_from_forgery
  before_action :require_login
  helper_method :attributes, :resource, :resource_class, :show_attributes
end