class SongList
	def search(title, options)
		p [title, options]
	end

	def search2(title, genre: nil, duration: 120)
		p [title, genre, duration]
	end

	def search3(title, genre: nil, duration: 120, **rest)
		p [title, genre, duration, rest]
	end

	def search4(title, *rest, genre: nil, duration: 120, **filter)
		p [title, rest, genre, duration, filter]
	end
end

list = SongList.new
list.search("for fun", {genre: "Pop", duration: 150})
list.search2("for food", genre: "Rap")
#list.search2("for food", singer: "Rap") # error
list.search3("for food", composer: "Dont care", genre: "Rock", duration: 239, artist: "MJ")
list.search4("for food", "chido di", composer: "Dont care", genre: "Rock", duration: 239, artist: "MJ")
