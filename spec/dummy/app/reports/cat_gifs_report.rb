class CatGifsReport < Dossier::Report

  HEADERS = -> { %w[] }
  ROWS    = -> { [
    [],
    [],
    [],
  ] }

  def initialize(*)
    super
    self.results = OpenStruct.new(headers: HEADERS.call, rows: ROWS.call)
  end

  class Display < Dossier::Display

    ids true
    classes ->(column) { "kitty-gifs-#{column}" }

    table_id 'the-cat-gif-report-to-end-all-cat-gif-reports'
  end
end

Dossier::Display.table_class = 'fancified-table'
