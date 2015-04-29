class SingleCd
  @@all_cds = []

  define_method(:initialize) do |album, artist|
    @album = album
    @artist = artist
  end

  define_method(:album) do
    @album
  end

  define_method(:artist) do
    @artist
  end
end
