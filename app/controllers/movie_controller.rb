# frozen_string_literal: true

# Controler that manages all actions related to movie creation, room assignment and movie schedule
class MovieController < ApplicationController
  def home; end

  def new
    @movie_times = MovieTime.new
  end

  def post
    title = params[:title]
    image = params[:image]
    age_restriction = params[:age_restriction]
    language = params[:language]
    @movie = Movie.new(title:, image:, age_restriction:, language:)
    if @movie.save
      redirect_to '/movie/new', notice: 'Pelicula creada con exito'
    else
      redirect_to '/movie/new', notice: @movie.errors.messages
    end
  end

  def create_movie_time
    movie_time_params = params.require(:movie_time).permit(:movie_id, :time, :date_start,
                                                           :date_end, :place, :room)
    movie_time = MovieTime.create(movie_time_params)
    if movie_time.persisted?
      redirect_to '/movie/new', notice: 'Pelicula asignada con exito'
    else
      redirect_to '/movie/new', notice: movie_time.errors.messages
    end
  end

  # rubocop:disable Metrics/MethodLength
  def list_by_date
    params.require(:date)
    params.require(:sucursal)
    params.require(:age)
    params.require(:language)
    @date = params[:date]
    place = params[:sucursal]
    age = params[:age]
    language = params[:language]
    @filter = Movie.where([
                            '(age_restriction = ?) or (age_restriction = ? and ? >= 18)',
                            'no', 'si', age
                          ])
    @filter = if language == 'ES'
                @filter.order(language: :desc)
              else
                @filter.order(language: :asc)
              end
    @filter = @filter
              .includes(:movie_times)
              .where([
                       'movie_times.date_start <= ?
                        and ? <= movie_times.date_end
                        and movie_times.place = ?',
                       @date, @date, place
                     ])
              .references(:movie_times)
  end
  # rubocop:enable Metrics/MethodLength
end
