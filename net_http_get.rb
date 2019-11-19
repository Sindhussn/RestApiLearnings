require 'net/http'
require 'byebug'
def print_popularity(movieObject)
	case movieObject.code
		when "200"
			movieArray = eval(movieObject.body)[:results]
			movieArray.each_with_index do |movies, ranking|
				puts "#{ranking+1} - #{movies[:title]}}"
			end
		when "404"
			puts "page not found"
		when "401"
			puts "authentication error"
	end
end

popular_movies = Net::HTTP.get_response("api.themoviedb.org", "/3/movie/popular?api_key=1f6edcf7cdec1a1942d5d87e84a1ab89")
top_rated_movies = Net::HTTP.get_response("api.themoviedb.org", "/3/movie/top_rated?api_key=1f6edcf7cdec1a1942d5d87e84a1ab89")
puts("================Popular Movies=================")
print_popularity(popular_movies)
puts("================Top Rated Movies=================")
print_popularity(top_rated_movies)