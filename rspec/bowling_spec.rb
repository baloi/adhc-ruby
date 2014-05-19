class Bowling
  def initialize
    @hits = 0
  end

  def hit(pins)
    @hits = @hits + pins
  end

  def score
    @hits 
  end
end

describe Bowling, "#score" do
  it "returns 0 for all gutter game" do
    bowling = Bowling.new
    20.times {bowling.hit(0)}
    bowling.score.should eq(0)
  end
end
