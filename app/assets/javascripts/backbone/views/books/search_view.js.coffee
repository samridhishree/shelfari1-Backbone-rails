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
      # @collection = results
      @render()

      for book in results.models
        @addOne book

  addOne: (book) =>
    console.log("In search view addOne")
    console.log(book)
    view = new Shelfari.Views.Books.BookView({model : book})
    @$("tbody").append(view.render().el)
    
  render: () ->
      console.log ('In search view render')
      $(@el).html(@template())

      return this
      
  searchResults: (e) ->
    console.log ('In search view searchResults')
    e.preventDefault()
    console.log ($("#searchParam").val())
    resultCollection = new Shelfari.Collections.SearchResultsCollection()
    console.log(resultCollection) 
    resultCollection.search($("#searchParam").val());
    #@showResults(results)