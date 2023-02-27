getinchi<-function(getPCID)
{
  #################################
  url<-"http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getCID,"/property/CanonicalSMILES,MonoisotopicMass,InChI,InChIKey,MolecularFormula"))},error = function(x) {return(NA)})
  ############################
  OIN<-tryCatch({out$PropertyTable$Properties$InChI},error=function(cond){return(NA)})
  #############################
  return(tryCatch({OIN[1]},error = function(x) {return(NA)}))
}
