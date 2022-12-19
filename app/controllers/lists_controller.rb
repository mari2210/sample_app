class ListsController < ApplicationController
  def new
    # Viewへ渡すためのいんスタンス変数に空のModelオブジェクトを生成する
    @list=List.new
  end
  # 以下を追加
  def create
    # 1.&2.データを受け取り新規登録するためのインスタンス作成
    @list=List.new(list_params)
    # 3.データをデータベースに保存するためのsaveメそッど実行
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
    # 4.トップ画面にリダイレクト
    # redirect_to '/top'
    # 詳細画面にリダイレクト
    #redirect_to list_path(list.id)
  end

  def index
    @lists=List.all
  end

  def show
    @list=List.find(params[:id])
  end

  def edit
    @list=List.find(params[:id])
  end

  def update
    list=List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)

  end

  def destroy
    list=List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
