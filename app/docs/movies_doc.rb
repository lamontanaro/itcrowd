module MoviesDoc
  extend Apipie::DSL::Concern

  def_param_group :movies do
    param :title, String, "title of the movies",:required => true
    param :release_year, Integer, "release_year of the movies", :required => true
  end

  def_param_group :full_movies do
    param :title, String, "title of the movies",:required => true
    param :release_year, Integer, "release_year of the movies", :required => true
    param :people_movies, Hash, :action_aware => true, :required => true do
      param :role, String, "Role the person in the people_movies",:required => true
      param :people, Hash, :action_aware => true, :required => true do
        param :last_name, String, "last_name of the people",:required => true
        param :first_name, String, "first_name of the people", :required => true
        param :aliases, String, "aliases of the people", :required => true
      end
    end
  end

  api :GET, '/movies', 'List movies'
  returns :array_of => :full_movies, :code => 200, :desc => "All movies"
  def index
  end

  api :GET, '/movies/:id', 'Show movie'
  param :id, :number, :required => true
  returns :full_movies, :desc => "The movie"
  def show
  end

  api :PATH, '/movies', 'Update a movie'
  param_group :movies
  returns :movies, :desc => "Update movie"
  def update
  end

  api :POST, '/movies', 'Create a movie'
  param_group :movies
  returns :movies, :desc => "New movies"
  def create
  end

  api :DELETE, '/movies/:id', 'Delete movie'
  param :id, :number, :required => true
  def destroy
  end
end