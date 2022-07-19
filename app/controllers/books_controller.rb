class BooksController < ApplicationController
    before_action :set_book, only: %i[show edit update destroy]
    
    def index
        if params[:state].present?
            if params[:state] = 1
                @books = Book.where(status: 1).order(:title)
            elsif params[:state] = 2
                @books = Book.where(status: 0).order(:title)
            elsif params[:state] = 3
                @books = Book.all.order(:title)
            end
        else
            @books = Book.all.order(:title)
        end
    end

    def show
        @borrowings = Borrowing.all.where(book_id: params[:id])
    end

    def new
        @book = Book.new
        @statuses = Book.statuses.keys
    end

    def edit
        @statuses = Book.statuses.keys
    end

    def create
         @book = Book.create(book_params)

         if @book.save
            redirect_to @book
         else
            render :new
         end
    end

    def update

        if @book.update(book_params)
            redirect_to @book
        else
            render :edit
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :status)
    end

end