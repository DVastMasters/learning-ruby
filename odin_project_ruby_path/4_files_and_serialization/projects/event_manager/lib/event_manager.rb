require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'time'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('../output') unless Dir.exist?('../output')

  filename = "../output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def group_by_hour(reg_dates)
  reg_dates.group_by(&:hour)
end

puts 'Event Manager Initialized!'

contents = CSV.open(
  '../event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('../form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end

contents.rewind

reg_hours = contents.each_with_object(Hash.new(0)) do |row, hs|
  time = Time.strptime(row[:regdate], '%m/%d/%y %k:%M')
  hs[time.hour] += 1
end

pp(reg_hours.sort { |a, b| b[1] <=> a[1] })

contents.rewind

week_days = contents.each_with_object(Hash.new(0)) do |row, hs|
  time = Time.strptime(row[:regdate], '%m/%d/%y %k:%M')
  hs[time.strftime('%A')] += 1
end

pp(week_days.sort { |a, b| b[1] <=> a[1] })