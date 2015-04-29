require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/single_cd')
require('./lib/cd_rack')

get('/') do
  @all_genres = CdRack.all()
  erb(:index)
end

get('/all_genres/') do
  @all_genres = CdRack.all()
  erb(:all_genres)
end

get('/all_genres/new') do
  erb(:genre_form)
end

get('/all_genres/:id') do
  @genre = CdRack.find(params.fetch('id').to_i())
  erb(:genre_page)
end

get('/new') do
  erb(:genre_form)
end

post('/all_genres') do
  name = params.fetch('name')
  CdRack.new(name).save()
  @all_genres = CdRack.all()
  erb(:success)
end

get('/:id') do
  @genre = CdRack.find(params.fetch('id').to_i())
  erb(:genre_page)
end

get('/all_genres/:id/all_cds/new') do
  @genre = CdRack.find(params.fetch('id').to_i())
  erb(:genre_cd_form)
end

post('/all_cds') do
  album = params.fetch('album')
  artist = params.fetch('artist')
  @cd = SingleCd.new(album, artist)
  @cd.save()
  @genre = CdRack.find(params.fetch('genre_id').to_i())
  @genre.add_cd(@cd)
  erb(:success)
end
