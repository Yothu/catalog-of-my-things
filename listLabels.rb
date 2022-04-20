class ListLabel 
  def initialize
    @labels = []
  end

  def list_all_labels
    @labels.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end
end