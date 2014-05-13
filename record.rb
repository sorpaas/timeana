require 'json'
require 'date'

class Record
  attr_accessor :path, :projects, :end_date, :start_date, :application, :duration
  
  def self.loadJSON(json_filename)
    raw_data = JSON.parse(File.read(json_filename))
    results = []
    raw_data.each do |item|
      duration_raw_data = item['duration'].split(':').map { |x| x.to_i }
      
      record = Record.new
      record.path = item['path']
      record.projects = item['projects']
      record.end_date = DateTime.strptime(item['endDate'], '%d/%m/%y %I:%M %p')
      record.start_date = DateTime.strptime(item['startDate'], '%d/%m/%y %I:%M %p')
      record.application = item['application']
      record.duration = duration_raw_data[0] * 60 * 60 + 
                        duration_raw_data[1] * 60 + 
                        duration_raw_data[2]
      
      results << record
    end
    results
  end
end