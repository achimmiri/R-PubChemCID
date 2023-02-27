getsmiles<-function(getCID)
{
  #################################
  url<-"http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getCID,"/property/CanonicalSMILES,MonoisotopicMass,InChI,InChIKey,MolecularFormula"))},error = function(x) {return(NA)})
  ############################
  OSM<-tryCatch({out$PropertyTable$Properties$CanonicalSMILES},error=function(cond){return(NA)})
  #############################
  return(tryCatch({OSM[1]},error = function(x) {return(NA)}))
  #############################
}

