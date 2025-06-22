
ui <- function() {
 
  bslib::page_fluid(
    theme = bslib::bs_theme(
      version = 5,
      base_font = bslib::font_collection(bslib::font_google("Atkinson Hyperlegible"), "Arial Narrow Bold", "sans-serif"),
      code_font = bslib::font_collection(bslib::font_google("Atkinson Hyperlegible"), "Arial Narrow Bold", "sans-serif"),
     bootswatch = "materia"
    ),
    
    shinyjs::useShinyjs(),
    title = "SORTEE DCQC",
    fluidRow(
      column(
        width = 1,
        actionButton(
          inputId = "clickme",
          label = tags$img(src = "circle_black.png", height = "78px", width = "78px",
                        onclick ="window.open('https://www.sortee.org/', '_blank')"),
          style = "color: white; background-color: white; border-color: white; box-shadow: 0px 0px 0px 0px white;",
        )
      ),
      column(
        width = 11,
        div(
          style = "display: flex; align-items: center; height: 78px;",
          h1("SORTEE Data and Code Quality Control", style = "margin: 0;")
        )
      )
    ),
    bslib::layout_sidebar(
      sidebar =
        bslib::sidebar(
          width = 400,
          position = "left",
          open = "open",
          shiny::div(
            id = "review_summary",
            bslib::card(
            shiny::htmlOutput("paper_title_output"),
            shiny::htmlOutput("reviewer_name_output"),
            shiny::htmlOutput("journal_name_output")
          )
          ),
          shiny::downloadButton("download_DCQCpdf", "Download PDF Report",class = "btn-info")
        ),
      div(id = "stage1_title",
      h4("Stage 1: Data and metadata must be archived and adhere to FAIR guiding principles")
      ),
      create_card("1", "Data are in a public repository"),
      br(),
      create_card("2", "Data repository has a persistent identifier (e.g., a DOI)"),
      br(),
      create_card("3", "Data are cited in the manuscript (in data availability statement or similar, as well as in the Literature Cited)"),
      br(),
      create_card("4", "Data repository has a data-specific license"),
      br(),
      create_card("6", "All necessary data files are present in the repository"),
      br(),
      create_card("7", "Data are contained in an interoperable format"),
      br(),
      create_card("8", "Metadata present (including README file)"),
      br(),
      create_card("9", "Metadata adequate (including README file)"),
      br(),
      br(),
      div(id = "stage2_title",
      h4("Stage 2: Archived data corresponds with the data reported in the manuscript")
      ),
      create_card("10", "Variables used in analysis present in the data"),
      br(),
      create_card("11", "The structure of the data presented matches the manuscript (e.g., it is the right size, do the number of levels of a factor match)"),
      br(),
      br(),
      div(id = "stage3_title",
      h4("Stage 3: Code and metadata must be archived and adhere to FAIR guiding principles")
      ),
      create_card("12", "Code has a repository"),
      br(),
      create_card("13", "Code repository has a DOI"),
      br(),
      create_card("14", "Code is cited in manuscript  (in data availability statement or similar, as well as in the Literature Cited)"),
      br(),
      create_card("15", "Code repository has a code-specific license"),
      br(),
      create_card("16", "Code files are present in the repository"),
      br(),
      create_card("17", "Code is contained in an interoperable format e.g. .R, .py., .txt, .rmd, .jl"),
      br(),
      create_card("18", "Metadata present (README file and annotations in code)"),
      br(),
      create_card("19", "Metadata adequate"),
      br(),
      br(),
      div(id = "stage4_title",
      h4("Stage 4: Archived code matches the manuscript")
      ),
      create_card("20", "Code is present for all analyses in the manuscript, along with code used to produce figures/tables where appropriate"),
      br(),
      br(),
      div(id = "stage5_title",
      h4("Stage 5: Archived code runs with the archived data")
      ),
      create_card("21", "Runs with minimal changes (e.g.changing file paths)"),
      br(),
      br(),
      div(id = "stage6_title",
      h4("Stage 6: Results can be computationally reproduced by running the archived code")
      ),
      create_card("22", "Numeric results (in table or text)"),
      br(),
      create_card("23", "Figures")
    )
    )
}
