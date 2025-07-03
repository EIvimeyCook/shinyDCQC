create_card <- function(id, label) {
    div(
      id = id,
      strong(label),
      br(),
      br(),
      shinyWidgets::radioGroupButtons(
        inputId = paste0("check_", id),
        label = NULL,
        choices = c("Yes", "No"),
        justified = TRUE,
        individual = TRUE,
        selected = character(0)
      ),
      textAreaInput(
        inputId = paste0("item_", id, "_comment"),
        label = NULL,
        placeholder = "Comment",
        width = "1500px",
        height = "50px"
      )
  )
}

  card_labels <- list(
  "1" = "Data are in a public repository *[(click here)](https://journals.plos.org/plosone/s/recommended-repositories)*",
  "2" = "Data repository has a persistent identifier (e.g., a DOI)",
  "3" = "Data are cited in the manuscript (in data availability statement or similar, as well as in the Literature Cited)",
  "4" = "Data repository has a data-specific license *[(click here)](https://creativecommons.org/chooser/)*",
  "6" = "All necessary data files are present in the repository",
  "7" = "Data are contained in an interoperable format",
  "8" = "Metadata present (including README file)",
  "9" = "Metadata adequate (including README file)",
  "10" = "Variables used in analysis present in the data",
  "11" = "The structure of the data presented matches the manuscript",
  "12" = "Code has a repository",
  "13" = "Code repository has a DOI",
  "14" = "Code is cited in manuscript (in data availability statement or similar, as well as in the Literature Cited)",
  "15" = "Code repository has a code-specific license",
  "16" = "Code files are present in the repository *[(click here)](choosealicense.com)*",
  "17" = "Code is contained in an interoperable format e.g. .R, .py., .txt, .rmd, .jl",
  "18" = "Metadata present (README file and annotations in code)",
  "19" = "Metadata adequate",
  "20" = "Code is present for all analyses in the manuscript",
  "21" = "Runs with minimal changes (e.g. changing file paths)",
  "22" = "Numeric results (in table or text)",
  "23" = "Figures"
)
  
  create_card_comment <- function(id, label) {
    div(
      id = id,
      label = NULL,
      textAreaInput(
        inputId = paste0("item_", id, "_comment"),
        label = NULL,
        placeholder = "Comment",
        width = "1500px",
        height = "50px"
      )
    )
  }