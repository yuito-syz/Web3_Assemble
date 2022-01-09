class Search::WordOfMounth < Search::Base
    ATTRIBUTES = %i(
      name
    )
    attr_accessor(*ATTRIBUTES)
  
    def matches
      t = ::WordOfMounth.arel_table
      results = ::WordOfMounth.all
      results = results.where(contains(t[:name], name)) if name.present?
      results
    end
end