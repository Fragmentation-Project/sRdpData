test_that("srdp_orgs() returns the organization-level dataframe", {

  expect_equal(length(srdp_orgs()), 5)

})

test_that("srdp_groups() returns the group-level dataframe", {

  expect_equal(length(srdp_groups()), 5)

})
