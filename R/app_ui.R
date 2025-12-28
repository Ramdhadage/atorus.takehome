#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # External resources (CSS, JS, favicon)
    golem_add_external_resources(),

    # Initialize shinyjs
    shinyjs::useShinyjs(),

    # Initialize AWN notifications
    awn::useAwn(),

    bslib::page_navbar(
      title = "Data Explorer",
      id = "navbar",
      theme = bslib::bs_theme(version = 5),
      fillable = TRUE,

      bslib::nav_spacer(),
      bslib::nav_panel(
        title = "Home",
        value = "home",

        # Page header using bslib card
        # bslib::card(
        # class = "page-header",
        # bslib::card_body(
        strong(h1("MTCars Dataset")),
        p("Interactive data table with real-time editing"),
        # )
        # ),

        # Main content: Table module
        mod_table_ui("table")
      ),

      bslib::nav_panel(
        title = "Analytics",
        value = "analytics"
      ),

      bslib::nav_panel(
        title = "Settings",
        value = "settings"
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www"),

  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Take-Home Assignment Solution"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
