class Search::WordOfMounth < Search::Base
    ATTRIBUTES = %i(
      name
    )
    attr_accessor(*ATTRIBUTES)
  
    def matches
      t = ::WordOfMounth.arel_table
      results = ::WordOfMounth.all
      results = results.where(contains(t[:code], code)) if code.present?
      results = results.where(contains(t[:name], name)) if name.present?
      results = results.where(contains(t[:name_kana], name_kana)) if name_kana.present?
      results = results.where(t[:price].gteq(price_from)) if price_from.present?
      results = results.where(t[:price].lteq(price_to)) if price_to.present?
      if purchase_cost_from.present?
        results = results.where(t[:purchase_cost].gteq(purchase_cost_from))
      end
      if purchase_cost_to.present?
        results = results.where(t[:purchase_cost].lteq(purchase_cost_to))
      end
      results = results.where(availability: true) if value_to_boolean(availability)
      results
    end
  end