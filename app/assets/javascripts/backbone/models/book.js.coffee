class Shelfari.Models.Book extends Backbone.Model
  paramRoot: 'book'

  defaults:
    name: null
    author: null
    status: null

class Shelfari.Collections.BooksCollection extends Backbone.Collection
  model: Shelfari.Models.Book
  url: '/books'

class Shelfari.Collections.SearchResultsCollection extends Backbone.Collection
  url: '/search'
    #"/search/" + @searchTerm
  
  search: (searchTerm) ->
    results = new SearchResults()
    results.searchTerm = searchTerm
    results.fetch
      success: ->
        Shelfari.vent.trigger "search:results", results

      error: (collection, response) ->
        Shelfari.vent.trigger "search:error", response