library(shinytest2)
library(atorus.takehome)
# Helper to start app driver with safe teardown
start_app <- function(...) {
  app <- AppDriver$new(app_dir = "../../", load_timeout = 20000, variant = platform_variant(), expect_values_screenshot_args = FALSE, width = 1200, height = 1600)

  app
}
test_that("app launches with default values", {
  app <- start_app()
  app$wait_for_idle(1500)
  # app$wait_for_value(output = "table-table", timeout = 10000)
  app$wait_for_idle(1500)
  app$expect_values(name = "app-launches")
})
