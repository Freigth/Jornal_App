class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = current_user.categories
    end

    def show
    end

    def edit
        @category = current_user.categories.find(params[:id])
    end

    def create
        @category = current_user.categories.build(category_params)

        respond_to do |format|
            if @category.save
                format.html { redirect_to categories_path, notice: 'Category was successfully added.' }
            else
                format.html { render :new, status: :unprocessable_entity }
                flash[:error] = 'Please, check your input.'
            end
        end

    end

    def new
        @category = current_user.categories.build
    end

    def destroy
        @category = current_user.categories.find(params[:id])
        @category.destroy

        respond_to do |format|
            format.html { redirect_to categories_path, notice: "Category was successfully deleted." }
        end
    end

    def update
        @category = current_user.categories.find(params[:id])

        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to categories_path, notice: "Category was successfully updated." }
            else
                format.html { redirect_to categories_path, notice: "Please, check your input." }
            end
        end

    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

end