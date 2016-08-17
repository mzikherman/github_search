class Repo < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_readme,
                  against: [:name, :description, :readme],
                  using: {
                  	tsearch: { prefix: true }
                  }
end
