class Shelfari.Routers.BooksRouter extends Backbone.Router
  initialize: (options) ->
    @books = new Shelfari.Collections.BooksCollection()
    @searchbooks = new Shelfari.Collections.SearchResultsCollection()
    @books.reset options.books
    

  routes:
    "new"      : "newBook"
    "index"    : "index"
    "search"   : "search"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newBook: ->
    @view = new Shelfari.Views.Books.NewView(collection: @books)
    $("#books").html(@view.render().el)

  index: ->
    @view = new Shelfari.Views.Books.IndexView(books: @books)
    $("#books").html(@view.render().el)

  show: (id) ->
    book = @books.get(id)

    @view = new Shelfari.Views.Books.ShowView(model: book)
    $("#books").html(@view.render().el)

  edit: (id) ->
    book = @books.get(id)

    @view = new Shelfari.Views.Books.EditView(model: book)
    $("#books").html(@view.render().el)

  search: ->
    console.log ('in router search')
    console.log (@searchbooks)
    @view = new Shelfari.Views.Books.SearchView(books: @searchbooks)
    console.log (@view.render())
    $("#books").html(@view.render().el)
