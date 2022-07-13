class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def show
    end

    def edit
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(category_params)

        respond_to do |format|
            if @category.save
                format.html { redirect_to categories_path }
                flash[:notice] = 'successfully added!'
            else
                format.html { render :new, status: :unprocessable_entity }
                flash[:error] = 'Error: check your input'
            end
        end

    end

    def new
        @category = Category.new
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy

        respond_to do |format|
            format.html { redirect_to categories_path, notice: "Category was successfully destroyed." }
        end
    end

    def update
        @category = Category.find(params[:id])

        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to categories_path, notice: "Category was successfully updated." }
            else
                format.html { redirect_to categories_path, notice: "Category name should exist." }
            end
        end

    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

end