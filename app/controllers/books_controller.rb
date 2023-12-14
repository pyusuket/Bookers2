class BooksController < ApplicationController
    def new
      @book = Book.new
    end
    
    def create
      @book = Book.new(book_params)  
      # ログインしているユーザーを認証してくれる。deviceを導入することで、current_userメソッドを使用可能。
      # @book(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。
      @book.user_id = current_user.id 
      @book.save
      # 作成した本のidが取得できる
      redirect_to book_path(@book.id)
    end
    
    def index
      @book = Book.new
      @books = Book.all
      @user = current_user
    end
    
    def show
      @book = Book.new
      @user = current_user
      @book = Book.find(params[:id])
      @user = @book.user
    end
    
    def edit
      @book = Book.find(params[:id])
    end
    
    def destroy
      
    end
    
    def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to book_path(@book.id)
    end
    
    private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
