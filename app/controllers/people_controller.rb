class PeopleController < ApplicationController

before_action :set_person, only: [:show, :edit, :update, :destroy ]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person, success: 'Персонал успешно обновлён'
    else
      render :new, danger: 'Персонал не обновлён'
    end
  end

  def edit
  end

  def update
    if @person.update_attributes(person_params)
      redirect_to @person, success: 'Персонал успешно обновлён'
    else
      render :edit, danger: 'Персонал не обновлён'
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path, success: 'Персонал успешно удалён'
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :bio, :schedule, :image)
  end

end
