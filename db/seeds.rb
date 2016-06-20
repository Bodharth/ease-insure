# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
url = "http://www.bimabazaar.com/general-insurance-news?format=feed&type=rss"
feeds = Feedjira::Feed.fetch_and_parse(url)
feeds.entries.each do |entry|
		NewsAndNotification.create!(
			:name => entry.title,
			:summary => entry.summary,
			:url => entry.url,
			:published_at => entry.published,
			:guid => entry.id)
end