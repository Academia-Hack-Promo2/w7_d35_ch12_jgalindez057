require 'httparty'

class Mashable
	include HTTParty
	base_uri 'http://mashable.com/stories.json'

	def list
		notice = self.class.get('')
		notice["hot"].each do |e|
		puts "#{e["author"]}"
		puts "#{e["title"]}"
		puts "#{e["link"]}"
		puts "#{e["post_date"]}"
		end
	end
end

class Digg
	include HTTParty
	base_uri 'http://digg.com/api/news/popular.json'

	def list
		notice = self.class.get('')
		notice["data"]["feed"].each do |e|
		puts "#{e["content"]["author"]}"
		puts "#{e["content"]["title_alt"]}"
		puts "#{e["content"]["url"]}"
		puts "#{e["date"]}"
		end
	end
end

class Reddit
	include HTTParty
	base_uri 'http://www.reddit.com/.json'

	def list
		notice = self.class.get('')
		notice["data"]["children"].each do |e|
		puts e["data"]["author"]
		puts e["data"]["title"]
		puts e["data"]["url"]
		puts e["data"]["created"]
		end
	end

end

def main
	mash = Mashable.new
	mash.list

	#digg = Digg.new
	#digg.list

	#redd = Reddit.new
	#redd.list
end
main