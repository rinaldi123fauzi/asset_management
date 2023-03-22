class UsersController < ApplicationController

  def index
    @users = User.all.order("CREATED_AT ASC")
  end

  def new
    @user = User.new
  end

  def create
    if params[:username].present?
      @user.email = "#{@email}"
      @user.password = "#{@password}"
      @user.name = params[:user][:name]
      @user.user_type = params[:user][:user_type]
      @user.role_ids = params[:user][:role_ids]
      @user.save
      bypass_sign_in current_user
      redirect_to users_path, notice: 'User was successfully created.'
    else
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to "/master/index?utf8=✓&pilihan=Data User", notice: 'User was successfully created.' }
          format.json { render :index, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    meth = params[:user][:password].blank? ? "update_without_password" : "update"

    respond_to do |format|
      if @user.send(meth, user_params)
        bypass_sign_in current_user
        format.html { redirect_to "/master/index?utf8=✓&pilihan=Data User", notice: 'User was successfully updated.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :user_type, :role_id, :state, role_ids: [])
  end

end
