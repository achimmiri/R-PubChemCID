getExactMass<-function(getCID)
{
  #######################
  #######################
  URL="https://pubchem.ncbi.nlm.nih.gov/rest/pug_view/data/compound/"
  URL1=paste0(URL,getCID, "/JSON/?response_type=display")
  ########################
  ########################
  data=tryCatch({jsonlite::fromJSON(URL1)} ,error = function(x) {return(NA)})
  ########################
  data1<-tibble::enframe(unlist(data))
  data2<-as.data.frame(data1)
  ##########################
  inVa<-tryCatch({which(data2$name %in% "Record.Section.Section.Section.Information.Value.StringWithMarkup.String")},error = function(x) {return(NA)})
  ##########################
  TEST<-tryCatch({sapply(data2, "[", inVa)},error = function(x) {return(NA)})
  TEST1<-tryCatch({grep("InChI=",TEST)},error = function(x) {return(NA)})
  TEST2<-tryCatch({TEST1[1]},error = function(x) {return(NA)})
  InchI<-tryCatch({TEST[TEST2]},error = function(x) {return(NA)})
  inchikey<-tryCatch({TEST[TEST2+1]},error = function(x) {return(NA)})
  #########################
  url<- "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/inchikey/"
  #########################
  out<-tryCatch({jsonlite::fromJSON(paste0(url,inchikey, "/JSON"))},error = function(x) {return(NA)})
  #########################
  EMV<-tryCatch({out$PC_Compounds$props[[1]][22,]$value$sval},error = function(x) {return(NA)})
  ########################
  EMV1<-c()
  ########################
  if(!sjmisc::is_empty(EMV))
  {
    EMV1<-c(EMV1,EMV)
  }else{
    EMV1<-c(EMV1,0)
  }
  ########################
  return(EMV1)
  ########################
  ########################
}

