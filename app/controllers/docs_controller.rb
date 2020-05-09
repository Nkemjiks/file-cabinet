class DocsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = current_user.docs.order('created_at DESC')
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = current_user.docs.new(doc_params)
    if @doc.save!
      redirect_to @doc
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @doc.update!(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

  def find_doc
    @doc = current_user.docs.where(id: params[:id]).first
  end

  def doc_params
    params.require(:doc).permit(:title, :content)
  end
end
