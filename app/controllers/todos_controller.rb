class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  def index
      @todos = if params[:text].present?
                   Current.user.todos.where("title LIKE ?", "%#{params[:text]}%")
      else
                   Current.user.todos
      end
  end

  def show
  end

  def new
      @todo = Todo.new
  end

  def create
      @todo = Current.user.todos.build(todo_params)

      if @todo.save
          redirect_to todos_path
      else
          render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
      if @todo.update(todo_params)
          redirect_to todos_path
      else
          render :edit, status: :unprocessable_entity
      end
  end

  def destroy
      @todo.destroy
      redirect_to todos_url
  end

  private

  def set_todo
      @todo = Current.user.todos.find(params[:id])
  end

  def todo_params
      params.expect(todo: [ :title, :description ])
  end
end
