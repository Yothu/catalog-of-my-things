# require_relative './tag_classes/label'

# module LabelJson
#   def save_labels(labels)
#     labels = labels.each_with_index.map do |label, index|
#       {
#         title: label.title, color: label.color, index: index
#       }
#     end
#     File.write('labels.json', JSON.generate(labels))
#   end

#   def load_labels
#     return [] unless File.exist?('labels.json')

#     file = File.open('labels.json')
#     read_file = File.read(file)
#     read_json = JSON.parse(read_file)

#     loaded_labels = []

#     load_labels.each do |label|
#       load_labels.push(Label.new(label['title'], label['color']))
#     end

#     load_labels
#     file.close
#   end
# end
