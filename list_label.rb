require 'json'

class ListLabel
  def initialize
    @labels = []
  end

  def list_all_labels
    @labels.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end

  def save_labels
    labels = @labels.each_with_index.map do |label, index|
      {
        title: label.title, color: label.color, index: index
      }
    end
    File.write('labels.json', JSON.generate(labels))
  end

  def load_labels
    return [] unless File.exist?('labels.json')

    file = File.open('labels.json')
    read_file = File.read(file)
    read_json = JSON.parse(read_file)

    loaded_labels = []

    read_json.each do |label|
      loaded_labels.push(Label.new(label['title'], label['color']))
    end
    file.close
    @labels = loaded_labels
  end
end
