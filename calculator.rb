class Calculator
  def initialize(str)
    @operations = /([\+\-\* \^\\])/
    str.gsub! /\s/, ""
    str = str.split ""
    find_expression(str)
  end

  def find_expression(str)
    leftparan = 0
    rightparan = 0
    index = nil
    str.each_with_index do |c, i|
      if c == "("
        leftparan += 1 
        index = i if leftparan == 1
      elsif c == ")"
        rightparan += 1       
      end
      if leftparan > 0 && rightparan == leftparan
        eval_expression str[index..i]
        leftparan = 0
        rightparan = 0
      end
    end
    return str
  end

  def eval_expression arr
    print arr
    find_expression arr[1...arr.length - 1]
  end
end

c = Calculator.new "(1 + 2) + (4 + 3))"
