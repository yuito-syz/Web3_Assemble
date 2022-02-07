require 'csv'
require 'bundle_outdated_formatter/formatter'

module BundleOutdatedFormatter
  # Formatter for TSV
  class TSVFormatter < Formatter
    def convert
      text = CSV.generate(force_quotes: true, col_sep: "\t") do |tsv|
        tsv << @columns
        @outdated_gems.each do |gem|
          tsv << gem.values
        end
      end
      text.chomp
    end
  end
end
