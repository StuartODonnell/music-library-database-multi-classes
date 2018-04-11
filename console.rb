require_relative('models/album.rb')
require_relative('models/artist.rb')
require('pry-byebug')

# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({
  
      "name" => "Tom Jones"
})

# artist1.save()

artist2 = Artist.new({

      "name" => "Dolly Parton"
})

# artist2.save()

album1 = Album.new({

      "album_title" => "Praise and Blame",
      "genre" => "Easy Listening",
      "artist_id" => artist1.id
  })

# album1.save()

album2 = Album.new({
  "album_title" => "The Love Collection",
  "genre" => "Easy Listening",
  "artist_id" => artist1.id
  })
# album2.save()

album3 = Album.new({
  "album_title" => "Pure and Simple",
  "genre" => "Country",
  "artist_id" => artist2.id
  })
# album3.save()

album4 = Album.new({
  "album_title" => "Backwoods Barbie",
  "genre" => "Country",
  "artist_id" => artist2.id
  })
# album4.save()

binding.pry
nil
