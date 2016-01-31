calcBMI<-function(weight,height) {
  weight/(height/100)^2
}

calcBMR<-function(weight,height,age,gender){
  if (gender=="Male"){
    10 * weight + 6.25 * height - 5 * age + 5
  }
  else if (gender=="Female"){
    10 * weight + 6.25 * height - 5 * age - 161
    
  }
}

calcCal<-function(act,BMR){
  if (act=="A") BMR*1
  else if (act=="B") BMR*1.2
  else if (act=="C") BMR*1.375
  else if (act=="D") BMR*1.55
  else if (act=="E") BMR*1.725
  else if (act=="F") BMR*1.9
}


#BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age(y) + 5         (man)
#BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age(y) - 161     (woman)

server<-function(input,output){
  #output$Oweight<-renderPrint(input$weight)
  #output$Oheight<-renderPrint(input$height/100)
  output$BMI<-renderPrint(calcBMI(input$weight,input$height))
  output$BMR<-renderPrint(calcBMR(input$weight,input$height,input$age,input$gender))
  output$CAL<-renderPrint(calcCal(input$activity,calcBMR(input$weight,input$height,input$age,input$gender)))
  
  output$Lose1 <-renderPrint(calcCal(input$activity,calcBMR(input$weight,input$height,input$age,input$gender))-500)
  output$Lose2 <-renderPrint(calcCal(input$activity,calcBMR(input$weight,input$height,input$age,input$gender))-1000)
  output$Lose3 <-renderPrint(calcCal(input$activity,calcBMR(input$weight,input$height,input$age,input$gender))+500)
  output$Lose4 <-renderPrint(calcCal(input$activity,calcBMR(input$weight,input$height,input$age,input$gender))+1000)
}