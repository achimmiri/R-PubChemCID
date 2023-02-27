getInchiKey<-<-function(getCID)
{
  #################################
  url<-"http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getCID,"/property/CanonicalSMILES,MonoisotopicMass,InChI,InChIKey,MolecularFormula"))},error = function(x) {return(NA)})
  ###out<-tryCatch({jsonlite::fromJSON(paste0(url,getCID,"/property/CanonicalSMILES,MonoisotopicMass,InChI,InChIKey"))},error = function(x) {return(NA)})
  ############################
  OIK<-tryCatch({out$PropertyTable$Properties$InChIKey},error=function(cond){return(NA)})
  #############################
  return(tryCatch({OIK[1]},error = function(x) {return(NA)}))
  #############################
}

