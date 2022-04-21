module Input
  def user_input
    gets.chomp
  end

  def y_n
    response = ''
    loop do
      print yield
      response = user_input
      break if response.upcase == 'Y' || response.upcase == 'N'
    end
    return true if response.upcase == 'Y'
    return false if response.upcase == 'N'
  end

  def text
    print yield
    user_input
  end
end
