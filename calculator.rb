require 'debugger'

class Calculator
  attr_reader :str
  def initialize
    @operations = /([\+\-\* \^\\])/
  end

  def eval str
    str.gsub! /\s/, ""
    str = str.split ""
    @str = str
    (find_expression @str)[0].to_i
  end

  def find_expression str
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
        str[index..i] = find_expression str[index + 1...i]
        find_expression str
      end
    end
    return eval_expression str
  end

  def eval_expression arr
    while arr.length > 1
      arr[1] = "**" if arr[1] == "^"
      value = arr[0].to_i.send arr[1].to_sym, arr[2].to_i
      arr = arr.drop(3)
      arr.insert 0, value.to_s
    end
    return arr
  end
end
