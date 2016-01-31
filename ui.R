library(shiny)

ui<-fluidPage(
  titlePanel("My Losing/Gaining Weight Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "age",label="Input your Age", value=30, min=1, max=99, step=1),
      radioButtons(inputId = "gender",label="Select your gender",choices = c("Male" = "Male","Female" = "Female")),
      sliderInput(inputId = "weight",label="Input your weight (kg)", value=70, min=10, max=150, step=1),
      sliderInput(inputId = "height",label="Input your height (cm)", value=170, min=90, max=200, step=1),
      selectInput(inputId = "activity", label="Activity:",
                  c("Sedentary - little or no exercise" = "B",
                    "Lightly Active - exercise/sports 1-3 times/week" = "C",
                    "Moderatetely Active - exercise/sports 3-5 times/week" = "D",
                    "Very Active - hard exercise/sports 6-7 times/week" = "E",
                    "Extra Active - very hard exercise/sports or physical job" = "F"
                  )),
      
      submitButton("Calculate")
    ),
  
    mainPanel(
      img(src="http://www.calories-calculator.net/images/logo.png", height = 73, width = 261),
      p("Nearly all of us seek to lose weight, and often the best way to do this is to consume a lower amount of calories each day than we usually do. But how many calories do we need to be healthy? Much depends, of course, on the amount of physical activity you engage in each day. And it's different for us all; there are a lot of different factors involved."),
      p("This Calorie Calculator is based on the Mifflin - St Jeor equation."),
      tabsetPanel(
        #h4("You weight entered(kg):"),
        #verbatimTextOutput("Oweight"),
        #h4("You height entered(m):"),
        #verbatimTextOutput("Oheight"),
        tabPanel("Your Calculation",
                 h4("Your Body Mass Index(BMI) is:"),
                 verbatimTextOutput("BMI"),
                 h4("Your Basal Metabolic Rate(BMR) is:"),
                 h6(tags$i("*This is the ideal amount of calories needed by your body (kcal)")),
                 verbatimTextOutput("BMR"),
                 br()
        ),
        tabPanel("Calories Intake Recommendation",br(),"To loss/gain 0.5kg per week, you will need to shave/consume 500 calories from your daily menu.",br(),
                 h6("Amount of calories/day needed to", strong("maintain")," your weight:"),
                 verbatimTextOutput("CAL"),
                 h6("Amount of calories/day needed to lose", strong("0.5 kg"),"per week:" ),
                 verbatimTextOutput("Lose1"),
                 h6("Amount of calories/day needed to lose", strong("1 kg"),"per week:" ),
                 verbatimTextOutput("Lose2"),
                 h6("Amount of calories/day needed to lose", strong("0.5 kg"),"per week:" ),
                 verbatimTextOutput("Lose3"),
                 h6("Amount of calories/day needed to lose", strong("0.5 kg"),"per week:" ),
                 verbatimTextOutput("Lose4")
        )
      )
      
    )
  )
  
  
)
