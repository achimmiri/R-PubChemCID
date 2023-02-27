getMolecularFormula<-function(getCID)
{
  #################################
  url<-"http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getCID,"/property/CanonicalSMILES,MonoisotopicMass,InChI,InChIKey,MolecularFormula"))},error = function(x) {return(NA)})
  ############################
  OMF<-tryCatch({out$PropertyTable$Properties$MolecularFormula},error=function(cond){return(NA)})
  #############################
  return(tryCatch({OMF[1]},error = function(x) {return(NA)}))
  #############################
}

