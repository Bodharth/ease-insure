class NewsAndNotification < ActiveRecord::Base

	def self.update_from_news(feed_url)
		# url = "http://www.bimabazaar.com/general-insurance-news?format=feed&type=rss"
		feeds = Feedjira::Feed.fetch_and_parse(feed_url)
		feeds.entries.each do |entry|
			unless exists? :guid => entry.id
				create!(
					:name => entry.title,
					:summary => entry.summary,
					:url => entry.url,
					:published_at => entry.published,
					:guid => entry.id)
			end
		end

	end
end
