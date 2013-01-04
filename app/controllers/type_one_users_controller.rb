class TypeOneUsersController < ApplicationController
  load_and_authorize_resource

  def index
    @type_one_users = TypeOneUser.all
  end

  def new
    @type_one_user = TypeOneUser.new
  end

  def create
    @type_one_user = TypeOneUser.new(params[:type_one_user])
    if @type_one_user.save
      @type_one_user.deliver_reset_password_instructions!
      flash[:success] = 'Cadastrado com sucesso.'
      redirect_to type_one_users_path
    else
		  render :new
    end
  end

  def show
    @type_one_user = TypeOneUser.find_by_id(params[:id])
  end

  def edit
    @type_one_user = TypeOneUser.find_by_id(params[:id])
  end

  def update
    @type_one_user = TypeOneUser.find_by_id(params[:id])
    params[:type_one_user].delete :username
    @type_one_user.update_attributes(params[:type_one_user])
    if @type_one_user.save
      flash[:success] = 'Atualizado com sucesso.'
      redirect_to type_one_users_path
    else
      render :edit
    end
  end

  def destroy
    @type_one_user = TypeOneUser.find_by_id(params[:id])

    if @type_one_user == current_user
      redirect_to logout_path
    end

    if @type_one_user.destroy
      flash[:success] = 'Excluido com sucesso'
    else
      flash[:error] = 'Erro ao tentar excluir'
    end
    redirect_to type_one_users_path
  end
end

