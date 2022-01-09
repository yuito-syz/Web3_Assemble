class WordOfMouthsController < ApplicationController
  def index
    @q = WordOfMouth.search
  end

  def search
    @q = WordOfMouth.search(search_params)
    @word_of_mouths = @q
      .result
      .order
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
