require('pg')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id
  attr_writer :album_title, :genre

  def initialize(options)
    @id = options["id"].to_i
    @album_title = options["album_title"]
    @genre = options ["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (album_title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@album_title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|album_hash| self.new(album_hash)}
  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE albums SET (album_title, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@album_title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id =$1;"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    artist_hash = artists[0]
    return Artist.new(artist_hash)

  end

end
