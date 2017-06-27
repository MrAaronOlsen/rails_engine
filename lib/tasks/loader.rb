require 'CSV'

class Loader
  def initialize(path)
    @path = path
  end

  def load_data(table, *args)
    table.destroy_all
    
    CSV.foreach(@path, headers: true, header_converters: :symbol ) do |row|
      table.create(args.map { |arg| [arg, row[arg]] }.to_h)
    end
  end
end