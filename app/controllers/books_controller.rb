class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy]
  before_action :log_service
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #rescue_from StandardError, with: :internal_server_error


  # GET /books or /books.json
  def index
    # @books = Book.all
    # @books = Book.all.order(created_at: :desc)
    @books = Book.includes(:authors).all.order(created_at: :desc).load_async
  end

  # GET /books/1 or /books/1.json
  def show
    byebug
    log_service.info("Showing book with ID: #{@book.id}", ["BOOK_SHOW"])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Restore a soft-deleted record 
  # GET /books/1 or /books/1.json
  def restore
    deleted_book = Book.with_deleted.find(params[:id])
    deleted_book.restore
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully restored." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :content)
    end

    #Log service
    def log_service
      @log_service ||= LogService.new
    end

    #Exception 404
    def record_not_found
      render plain: '404 Not Found', status: 404
    end

    #Exception 500
    def internal_server_error(exception)
      logger.error(exception.message)
      logger.error(exception.backtrace.join("\n"))
      render plain: '500 Internal Server Error', status: 500
    end
  
end
