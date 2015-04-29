class SingleCd
  @@all_cds = []

  define_method(:initialize) do |album, artist|
    @album = album
    @artist = artist
    @id = @@all_cds.length().+(1)
  end

  define_method(:album) do
    @album
  end

  define_method(:artist) do
    @artist
  end

  define_method(:save) do
    @@all_cds.push(self)
  end

  define_singleton_method(:all) do
  @@all_cds
  end

  define_singleton_method(:clear) do
    @@all_cds = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |ident|
    found_cd = nil
    @@all_cds.each() do |item|
      if item.id().eql?(ident.to_i())
        found_cd = item
      end
    end
    found_cd
  end

  end
