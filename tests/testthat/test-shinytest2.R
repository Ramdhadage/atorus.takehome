devtools::load_all()
library(shinytest2)
# Helper to start app driver with safe teardown
start_app <- function(...) {
  app <- AppDriver$new(app_dir = "../../", load_timeout = 20000, variant = platform_variant(), width = 1200, height = 1600)

  app
}
test_that("app launches", {
  app <- start_app()
  app$wait_for_idle(1000)
  app$expect_screenshot(name = "app-launches")
})
