require './record'

# puts Record.loadJSON('data/export-20140513.json').map {|x| x.duration }.inject {|sum, x| sum+x} / 60 / 60

puts Dir.foreach('data')
  .map { |x| File.join('data', x) }
  .map { |x| { path: x, mtime: File.mtime(x) } if File.file?(x) }
  .reject { |x| x == nil }
  .sort { |a, b| b <=> a }
  .first