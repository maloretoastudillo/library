class BorrowingsController < ApplicationController
    before_action :set_borrowing, only: %i[ edit update destroy]


    def new
        @borrowing = Borrowing.new
        @books = Book.all.pluck(:title, :id)
    end

    def create
         @borrowing = Borrowing.create(borrowing_params)
         @book = Book.find(borrowing_params[:book_id])

         if @borrowing.save
            redirect_to book_path(@book)
         else
            render :new
         end
    end

    def edit
        @books = Book.all.pluck(:title, :id)
    end

    def update
        @book = Book.find(borrowing_params[:book_id])

        if @borrowing.update(borrowing_params)
             redirect_to book_path(@book)
        else
             render :edit
        end
    end

    def destroy
        @book =  @borrowing.book
        @borrowing.destroy
        redirect_to book_path(@book)
    end

    private

    def set_borrowing
        @borrowing = Borrowing.find(params[:id])
    end

    def borrowing_params
        params.require(:borrowing).permit(:borrowed_to, :borrowed_at, :returned_at, :book_id)
    end

end