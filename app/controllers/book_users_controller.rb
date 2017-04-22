class BookUsersController < ApplicationController
  before_action :set_book_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /book_users
  # GET /book_users.json
  def index
    @book_users = BookUser.set_current_user_records(current_user)
  end

  # GET /book_users/1
  # GET /book_users/1.json
  def show
  end

  # GET /book_users/new
  def new
    @book_user = BookUser.new
  end

  # GET /book_users/1/edit
  def edit
  end

  # POST /book_users
  # POST /book_users.json
  def create

    @book_user = BookUser.new
    BookUser.create_book_user(params[:id],current_user,@book_user)   
  
    respond_to do |format|
      if @book_user.save
        # format.html { redirect_to @book_user, notice: 'Book user was successfully created.' }
        # format.json { render :show, status: :created, location: @book_user }
        format.js{}
      else
        # format.html { render :new }
        # format.json { render json: @book_user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /book_users/1
  # PATCH/PUT /book_users/1.json
  def update
    respond_to do |format|
      if @book_user.update(book_user_params)
        format.html { redirect_to @book_user, notice: 'Book user was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_user }
      else
        format.html { render :edit }
        format.json { render json: @book_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_users/1
  # DELETE /book_users/1.json
  def destroy
    @book_user.destroy
    respond_to do |format|
      format.html { redirect_to book_users_url, notice: 'Book user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_user
      @book_user = BookUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_user_params
      params.require(:book_user).permit(:book_id, :user_id, :from, :to, :status_id)
    end
end
