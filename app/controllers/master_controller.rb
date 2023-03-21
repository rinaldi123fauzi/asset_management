class MasterController < ApplicationController
  def index
    @roles = Role.all.order("CREATED_AT ASC")
    @users = User.all.order("CREATED_AT ASC")
    @work_categories = WorkCategory.all.order("CREATED_AT DESC")
    @sub_work_categories = SubWorkCategory.all.order("CREATED_AT DESC")
    @units = Unit.all.order("CREATED_AT DESC")
    @material_types = MaterialType.all.order("CREATED_AT DESC")
    @areas = Area.all.order("CREATED_AT DESC")
  end
end
