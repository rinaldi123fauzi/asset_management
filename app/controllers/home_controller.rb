class HomeController < ApplicationController
  def index
    @softwares = Software.all()
    @tools = Tool.all()
  end
end
