class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
    def new
      @book = current_user.books.build
    end
    
    def create
      @book = Book.new(book_params)
      @user = current_user
      @book.user_id = current_user.id 
    
      if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render :index
      end
    end
    
    def index
      @books = Book.all
      @book = Book.new
      @user = current_user
      @book_new = Book.new
    end
    
    def show
      @user = User.all
      @user = current_user
      @book = Book.find(params[:id])
      @book_new = Book.new
      @user = @book.user
      @is_owner = @book.user == current_user
    end
    
    def edit
      @book = Book.find(params[:id])
    end
    
    def destroy
      @book = Book.find(params[:id])  
      @book.destroy  
      redirect_to books_path, notice: "Book was successfully destroyed."
    end
    
    def update
        @book = Book.find(params[:id])
        @user = @book.user
      
        if @book.update(book_params)
          flash[:notice] = "You have created book successfully."
          redirect_to book_path(@book.id)
        else
          @books = Book.all
          render :edit
        end
    end
    
    private

    def book_params
      params.require(:book).permit(:title, :body)
    end
    
    def correct_user
      @book = Book.find(params[:id])
      if current_user != @book.user
         redirect_to user_path(current_user)
      end
    end
end
