module PeopleDoc
  extend Apipie::DSL::Concern

  def_param_group :full_people do
    param :last_name, String, "last_name of the people",:required => true
    param :first_name, String, "first_name of the people", :required => true
    param :aliases, String, "aliases of the people", :required => true
    param :people_movies, Hash, :action_aware => true, :required => true do
      param :role, String, "Role the person in the people_movies",:required => true
      param :movies, Hash, :action_aware => true, :required => true do
        param :id, Integer, "Id of the movies", :required => true
        param :title, String, "title of the movies",:required => true
        param :release_year, Integer, "release_year of the movies", :required => true
      end
    end
  end

  def_param_group :people do
    param :last_name, String, "last_name of the people",:required => true
    param :first_name, String, "first_name of the people", :required => true
    param :aliases, String, "aliases of the people", :required => true
  end

  api :GET, '/people', 'List people'
  returns :array_of => :full_people, :code => 200, :desc => "All people"
  def index
  end

  api :GET, '/people/:id', 'Show person'
  param :id, :number, :required => true
  returns :full_people, :desc => "The person"
  def show
  end

  api :PATH, '/people', 'Update a person'
  param_group :people
  returns :people, :desc => "Update person"
  def update
  end

  api :POST, '/people', 'Create a person'
  param_group :people
  returns :people, :desc => "New people"
  def create
  end

  api :DELETE, '/people/:id', 'Delete person'
  param :id, :number, :required => true
  def destroy
  end
end