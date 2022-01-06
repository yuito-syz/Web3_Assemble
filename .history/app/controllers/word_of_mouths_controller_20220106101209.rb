class WordOfMouthsController < ApplicationController
  # 検索画面を初めて開いた段階では、検索結果を表示せず検索フォームのみ表示
  def index
    @q = WordOfMouth.search
  end

  def search
    @q = WordOfMouth.search(search_params)
    @word_of_mouths = @q
      .result
      .order(availability: :desc, code: :asc)
      .decorate
  end

  private

  # 検索フォームから受け取ったパラメータ
  def search_params
    search_conditions = %i(
      name_cont
    )
    params.require(:q).permit(search_conditions)
  end
end
