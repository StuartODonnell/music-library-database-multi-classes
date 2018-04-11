require('pg')
require_relative('album.rb')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def Artist.all
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist_hash| self.new(artist_hash)}
  end


  def albums_list()
    sql = "SELECT * FROM albums WHERE artist_id = $1 ORDER BY album_title;"
    values = [@id]
    albums_list = SqlRunner.run(sql, values)
    return albums_list.map {|albums_hash| Album.new(albums_hash)}
  end


end
