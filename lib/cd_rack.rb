class CdRack
  @@all_genres = []

  define_method(:initialize) do |genre|
    @genre = genre
    @id = @@all_genres.length().+(1)
    @cds = []
  end

  define_method(:genre) do
    @genre
  end

  define_method(:cds) do
    @cds
  end

  define_method(:save) do
    @@all_genres.push(self)
  end

  define_singleton_method(:all) do
    @@all_genres
  end

  define_singleton_method(:clear) do
    @@all_genres = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |ident|
    found_genre = nil
    @@all_genres.each() do |item|
      if item.id().eql?(ident.to_i())
        found_genre = item
      end
    end
    found_genre
  end

  define_method(:add_cd) do |cd|
    @cds.push(cd)
  end

end
