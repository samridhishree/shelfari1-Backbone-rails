Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.SearchView extends Backbone.View
  template: JST["backbone/templates/books/search"]

  events :
      "submit #search-book" : "searchResults"

  initialize: () ->
     console.log ('In search view initialize')
     Shelfari.vent.bind("search:results", this.showResults, this);


  showResults: (results) ->
      console.log("In showResults")
      console.log(results)
      @collection = results
      @render()
    
  render: () ->
      console.log ('In search view render')
      $(@el).html(@template())

      return this
      
  searchResults: (e) ->
    console.log ('In search view searchResults')
    e.preventDefault()
    console.log ($("#searchParam").val())
    resultCollection = new Shelfari.Collections.SearchResultsCollection() 
    resultCollection.search($("#searchParam").val());
    #@showResults(results)