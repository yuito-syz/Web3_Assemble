class WordOfMouthsController < ApplicationController
  # 検索画面を初めて開いた段階では、検索結果を表示せず検索フォームのみ表示
  def index
    @word_of_mouth = Search::WordOfMouth.new
  end

  def search
    @word_of_mouth = Search::WordOfMouth.new(search_params)
    @word_of_mouths = @word_of_mouth
      .matches
      .order(availability: :desc, code: :asc)
      .decorate
  end

  private

  # 検索フォームから受け取ったパラメータ
  def search_params
    params
      .require(:search_product)
      .permit(Search::Product::ATTRIBUTES)
  end
end
