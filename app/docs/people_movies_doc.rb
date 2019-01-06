module PeopleMoviesDoc
  extend Apipie::DSL::Concern

  def_param_group :people_movies do
    param :person_id, Integer, "id of the person", :required => true
    param :movie_id, Integer, "id of the people_movies", :required => true
    param :role, String, "Role the person in the people_movies",:required => true
  end

  api :GET, '/people_movies', 'List people_movies'
  returns :array_of => :people_movies, :code => 200, :desc => "All people_movies"
  def index
  end

  api :GET, '/people_movies/:id', 'Show people_movie'
  param :id, :number, :required => true
  returns :people_movies, :desc => "The people_movie"
  def show
  end

  api :PATH, '/people_movies', 'Update a people_movie'
  param_group :people_movies
  returns :people_movies, :desc => "Update people_movie"
  def update
  end

  api :POST, '/people_movies', 'Create a people_movie'
  param_group :people_movies
  returns :people_movies, :desc => "New people_movies"
  def create
  end

  api :DELETE, '/people_movies/:id', 'Delete people_movie'
  param :id, :number, :required => true
  def destroy
  end
end