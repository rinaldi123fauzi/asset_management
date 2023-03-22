class MasterController < ApplicationController
  def index
    @roles = Role.all.order("CREATED_AT ASC")
    @users = User.all.order("CREATED_AT ASC")
    @employees = Employee.all.order("CREATED_AT DESC")
    @softwares = Software.all.order("CREATED_AT DESC")
    @tools = Tool.all.order("CREATED_AT DESC")
    @vendors = Vendor.all.order("CREATED_AT DESC")
    @work_units = WorkUnit.all.order("CREATED_AT DESC")
  end
end
