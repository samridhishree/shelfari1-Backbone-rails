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
      if results.length > 0
        console.log("Length is greater than 0")
        @render1()
        for book in results.models
          @addOne book

      if results.length == 0
        @render2()

  addOne: (book) =>
    console.log("In search view addOne")
    console.log(book)
    view = new Shelfari.Views.Books.BookView({model : book})
    @$("tbody").append(view.render().el)
    
  render: () ->
      console.log ('In search view render')
      $(@el).html(@template())

      return this

  render1: () ->
      console.log ('In search view render1')
      #$('#books-search-table').css("display", "block")
      $(@el).html(@template())
      $('#books-search-table').show()

      return this

  render2: () ->
      console.log ('In search view rende2')
      $(@el).html(@template())
      $('#not-found').show()
      
      return this
      
  searchResults: (e) ->
    console.log ('In search view searchResults')
    e.preventDefault()
    console.log ($("#searchParam").val())
    resultCollection = new Shelfari.Collections.SearchResultsCollection()
    console.log(resultCollection) 
    resultCollection.search($("#searchParam").val());
    #@showResults(results)