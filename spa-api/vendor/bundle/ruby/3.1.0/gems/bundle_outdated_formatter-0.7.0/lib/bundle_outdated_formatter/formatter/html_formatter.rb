require 'rexml/document'
require 'bundle_outdated_formatter/formatter'

module BundleOutdatedFormatter
  # Formatter for HTML
  class HTMLFormatter < Formatter
    def initialize(options)
      super(options)

      @html = REXML::Document.new(nil, raw: :all)
      @root = REXML::Element.new('table')
      @html.add_element(@root)
    end

    def convert
      add_header_row

      @outdated_gems.each do |gem|
        add_data_row(gem)
      end

      io = StringIO.new
      xml_formatter.write(@html, io)
      io.string.chomp
    end

    private

    def add_header_row
      elements = @root.add_element(REXML::Element.new('tr'))

      @columns.each do |column|
        elements.add_element('th').add_text(column)
      end
    end

    def add_data_row(gem)
      elements = @root.add_element(REXML::Element.new('tr'))

      @columns.each do |column|
        escaped_text = REXML::Text.new(gem[column], false, nil, false)
        elements.add_element('td').add_text(escaped_text)
      end
    end
  end
end
