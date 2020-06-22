#' Import ESA SNAP .dim file
#' @author  Subhadip Datta
#' @param dim_path Path to the .dim file or a zip file contained .dim and .data.
#' @import sp
#' @import raster
#' @import rgeos
#' @import rgdal
#' @examples
#' library(raster)
#' library(ReadDIM)
#' im<-system.file("exd","td.dim",package = "ReadDIM")
#' read.dim(im)
#' @export
read.dim<-function(dim_path){
    f<-gsub(".dim",".data",dim_path)
    fil<-list.files(f,pattern = "*.img",full.names = TRUE)
    rasl<-c()
    for (i in seq(1,length(fil),1)){
      ras<-raster(fil[i])
      if(as.character(crs(ras))=="+proj=longlat +ellps=WGS84 +no_defs"){
        crs(ras)<-CRS("+proj=longlat +datum=WGS84 +no_defs")
        message("CRS warning fixed \n Done")
        rasl<-append(rasl,ras)
      } else{
        rasl<-append(rasl,ras)
      }
  }
  return(rasl)
}
