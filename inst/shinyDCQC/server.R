server <- function(input, output, session) {
 
  output$download_DCQCpdf <- shiny::downloadHandler(
    filename = function() {
      paste0("DCQC_Report_", input$paper_title, "_", input$reviewer_name, ".pdf")
    },
    
    content = function(file) {
      template_path <- system.file("rmd", "DCQC_report.Rmd", package = "shinyDCQC")
      tempReport <- file.path(tempdir(), "DCQC_report.Rmd")
      file.copy(template_path, tempReport, overwrite = TRUE)
    
      card_data <- lapply(names(card_labels), function(id) {
        response <- input[[paste0("check_", id)]]
        comment <- input[[paste0("item_", id, "_comment")]]
        if (!is.null(response)) {
          list(
            id = id,
            label = card_labels[[id]],
            response = response,
            comment = comment
          )
        } else {
          NULL
        }
      })
    
      card_data <- Filter(Negate(is.null), card_data)
      
      params <- list(
        paper_title = input$paper_title,
        reviewer_name = input$reviewer_name,
        journal_name = input$journal_name,
        report_date = Sys.Date(),
        card_data = card_data
      )
      
      rmarkdown::render(
        input = tempReport,
        output_file = file,
        params = params,
        envir = new.env(parent = globalenv())
      )
    }
  )
  
  
  
  data_modal <- shiny::modalDialog(
    easyClose = FALSE,
    footer = NULL,
    size = "l",
    fade = TRUE,
    shiny::div(
      style = "display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center;",
      shiny::tags$img(src = "circle_black.png", height = "88px", width = "88px", style = "margin-bottom: 20px;"),
      textInput("paper_title", strong("Paper Title"), placeholder = "Enter paper name", width = "300px"),
      textInput("reviewer_name", strong("Reviewer Name"), placeholder = "Enter your name", width = "300px"),
      textInput("journal_name", strong("Journal"), placeholder = "Enter journal name", width = "300px"),
      shinyWidgets::awesomeCheckboxGroup(
        inputId = "stage_checks",
        label = strong("Select DCQC Review Stages"), 
        choices = paste("Stage", 1:6),
        selected = character(0),
        inline = TRUE, 
        status = "success"
      ),
      actionButton("submit_data_modal", "Submit", class = "btn btn-success", style = "margin-top: 20px;")
    )
  )
  shinyjs::hide("stage1_title")
  shinyjs::hide("stage2_title")
  shinyjs::hide("stage3_title")
  shinyjs::hide("stage4_title")
  shinyjs::hide("stage5_title")
  shinyjs::hide("stage6_title")
  
  shinyjs::hide("1")
  shinyjs::hide("2")
  shinyjs::hide("3")
  shinyjs::hide("4")
  shinyjs::hide("5")
  shinyjs::hide("6")
  shinyjs::hide("7")
  shinyjs::hide("8")
  shinyjs::hide("9")
  shinyjs::hide("10")
  shinyjs::hide("11")
  shinyjs::hide("12")
  shinyjs::hide("13")
  shinyjs::hide("14")
  shinyjs::hide("15")
  shinyjs::hide("16")
  shinyjs::hide("17")
  shinyjs::hide("18")
  shinyjs::hide("19")
  shinyjs::hide("20")
  shinyjs::hide("21")
  shinyjs::hide("22")
  shinyjs::hide("23")
  shinyjs::hide("review_summary")
  shinyjs::hide("download_card")
  shiny::showModal(data_modal)
  
  shiny::observeEvent(input$submit_data_modal, {
     
    output$paper_title_output <- shiny::renderUI({
      shiny::HTML(paste(
      "<p>",
      "<b>Title:</b>",
      input$paper_title,
      "</p>"
      ))
    })
    
    output$reviewer_name_output <- shiny::renderUI({
      shiny::HTML(paste(
        "<p>",
        "<b>Name:</b>",
        input$reviewer_name,
        "</p>"
      ))
    })

      output$journal_name_output <- shiny::renderUI({
      shiny::HTML(paste(
        "<p>",
        "<b>Journal:</b>",
        input$journal_name,
        "</p>"
      ))
    })
    
    if("Stage 1" %in% input$stage_checks){
      shiny::removeModal() 
      shinyjs::show("review_summary")
      shinyjs::show("download_card")
      shinyjs::show("stage1_title")
      shinyjs::show("1")
      shinyjs::show("2")
      shinyjs::show("3")
      shinyjs::show("4")
      shinyjs::show("5")
      shinyjs::show("6")
      shinyjs::show("7")
      shinyjs::show("8")
      shinyjs::show("9")
    }
    
    if("Stage 2" %in% input$stage_checks){
      shiny::removeModal() 
      shinyjs::show("review_summary")
      shinyjs::show("download_card")
      shinyjs::show("stage2_title")
      shinyjs::show("10")
      shinyjs::show("11")
    } 
    
    if("Stage 3" %in% input$stage_checks){
      shiny::removeModal() 
      shinyjs::show("review_summary")
      shinyjs::show("download_card")
      shinyjs::show("stage3_title")
      shinyjs::show("12")
      shinyjs::show("13")
      shinyjs::show("14")
      shinyjs::show("15")
      shinyjs::show("16")
      shinyjs::show("17")
      shinyjs::show("18")
      shinyjs::show("19")
    }
    
    if("Stage 4" %in% input$stage_checks){
      shiny::removeModal() 
      shinyjs::show("review_summary")
      shinyjs::show("download_card")
      shinyjs::show("stage4_title")
      shinyjs::show("20")
    }
      
    if("Stage 5" %in% input$stage_checks){
      shiny::removeModal() 
      shinyjs::show("review_summary")
      shinyjs::show("download_card")
      shinyjs::show("stage5_title")
      shinyjs::show("21")
    }
    
    if("Stage 6" %in% input$stage_checks){
      shiny::removeModal() 
      shinyjs::show("review_summary")
      shinyjs::show("download_card")
      shinyjs::show("stage6_title")
      shinyjs::show("22")
      shinyjs::show("23")
    }
    
    if(length(input$stage_checks) == 0){
    shinyalert::shinyalert(
      title = "Select a stage to review",
      text = "No stage selected",
      size = "s", 
      closeOnEsc = TRUE,
      closeOnClickOutside = FALSE,
      html = FALSE,
      type = "error",
      showConfirmButton = TRUE,
      showCancelButton = FALSE,
      confirmButtonText = "OK",
      confirmButtonCol = "#AEDEF4",
      timer = 0,
      imageUrl = "",
      animation = TRUE
    )
    }
    
  })
  
  
}
