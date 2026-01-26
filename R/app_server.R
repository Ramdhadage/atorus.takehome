.datastore_cache <- NULL
.datastore_init_time <- Sys.time()

#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  if (is.null(.datastore_cache)) {
    .datastore_cache <<- DataStore$new()
    .datastore_init_time <<- Sys.time()
  } else {
    .datastore_cache$revert()
  }
  store <- .datastore_cache
  store_reactive <- reactiveVal(store)
  store_trigger <- reactiveVal(0)
  mod_table_server("table", store_reactive, store_trigger)
}
