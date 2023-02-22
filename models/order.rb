class Sale
  attr_reader :date, :gnumber, :oblast

  def initialize(date:, gnumber:, oblast:)
    @date = date
    @gnumber = gnumber
    @oblast = oblast
  end

  def json
    { 
      date: date,
      gnumber: gnumber,
      oblast: oblast,
    }.to_json
  end
end