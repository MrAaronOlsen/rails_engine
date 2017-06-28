require 'CSV'

class Loader
  def initialize(path)
    @path = path
  end

  def load_data
    CSV.foreach(@path, headers: true, header_converters: :symbol ) do |row|
      yield(row.to_h)
    end
  end
end