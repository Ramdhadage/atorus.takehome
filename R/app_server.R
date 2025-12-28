#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  store <- DataStore$new()
  store_reactive <- reactiveVal(store)
  store_trigger <- reactiveVal(0)
  mod_table_server("table", store_reactive, store_trigger)
}
