Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.SearchView extends Backbone.View
  template: JST["backbone/templates/books/search"]

  events :
      "submit #search-book" : "searchResults"

  initialize: () ->
     console.log ('In search view initialize')
     Shelfari.vent.bind("search:results", this.showResults, this);
    
  showResults: (results) ->
      @collection = results
      @render()
    
  render: () ->
      console.log ('In search view render')
      $(@el).html(@template())

      return this
    
  searchResults: () ->
    SearchResultsCollection.search($("#searchParam"));
    #@showResults(results)