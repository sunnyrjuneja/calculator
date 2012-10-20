require './calculator'

describe Calculator do

  before :all do
    @c = Calculator.new
  end

  subject { @c }

  describe "does basic operations" do
    it { @c.eval("1 + 2").should be 3 }
    it { @c.eval("3 - 2").should be 1 }
    it { @c.eval("4 / 2").should be 2 }
    it { @c.eval("4 * 3").should be 12 }
    it { @c.eval("3 ^ 2").should be 9 }
  end
end
