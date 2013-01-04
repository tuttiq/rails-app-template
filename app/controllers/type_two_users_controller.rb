class TypeTwoUsersController < ApplicationController
  load_and_authorize_resource

  def index
    @type_two_users = TypeTwoUser.all
  end

  def new
    @type_two_user = TypeTwoUser.new
  end

  def create
    @type_two_user = TypeTwoUser.new(params[:type_two_user])
    if @type_two_user.save
      @type_two_user.deliver_reset_password_instructions!
      flash[:success] = 'Cadastrado com sucesso.'
      redirect_to type_two_users_path
    else
		  render :new
    end
  end

  def show
    @type_two_user = TypeTwoUser.find_by_id(params[:id])
  end

  def edit
    @type_two_user = TypeTwoUser.find_by_id(params[:id])
  end

  def update
    @type_two_user = TypeTwoUser.find_by_id(params[:id])
    params[:type_two_user].delete :username
    @type_two_user.update_attributes(params[:type_two_user])
    if @type_two_user.save
      flash[:success] = 'Atualizado com sucesso.'
      redirect_to type_two_users_path
    else
      render :edit
    end
  end

  def destroy
    @type_two_user = TypeTwoUser.find_by_id(params[:id])

    if @type_two_user == current_user
      redirect_to logout_path
    end

    if @type_two_user.destroy
      flash[:success] = 'Excluido com sucesso'
    else
      flash[:error] = 'Erro ao tentar excluir'
    end
    redirect_to type_two_users_path
  end
end
