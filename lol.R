library(httr)
library(jsonlite)
library(ggplot2)
options(stringsAsFactors = FALSE)
#Caso n?o deseje que a fun??o busque certs valores, input = 0
summoner <- function(s.id, acc.id){
url.lol <- 'https://br1.api.riotgames.com/api/lol/na/v1.4/summoner/by-name/RiotSchmick?api_key=RGAPI-a7791de7-2301-4864-ad26-e738e334f152'
r <- '/recent'  
  if (s.id != 0){
    g <- s.id
    Summoner <- paste(f,g, sep = '')
    LOL <- GET(url = url.lol, path = Summoner)
    SummonerData <<- content(LOL)}
  if (acc.id != 0){
    h <- acc.id
    f <- '/lol/league/v3/positions/by-summoner/'
    m <- '/lol/match/v3/matchlists/by-account/' 
      matchRecent <- paste(m,h,r, sep = '')
        LOL.B <- GET(url = url.lol, path = matchRecent)
          RecentMatches <<- content(LOL.B)
            vec <<- t(as.vector(1:20))
              matchStats <- '/lol/match/v3/matches/'
              matchInfo <<- list(length=20)
              matchID <<- list(length=20)
                lap <<- lapply(vec, function(vec){
                  matchID[vec] <<- RecentMatches$matches[[vec]]$gameId
                  paste.id <- paste(matchStats,matchID[vec], sep='')
                  matchInfo[[vec]] <<- content(GET(url = url.lol, path = paste.id))
                  goldEarnedDelta[[vec]] <<- matchInfo[[vec]]$participants[[5]]$timeline$goldPerMinDeltas
                                                                              })}
                
}

summoner(s.id = 0, acc.id = '205441649')
SummonerData

for(m in 1:20){for(n in 1:10){
if(RecentMatches$matches[[m]]$role == matchInfo[[m]]$participants[[n]]$timeline$role &
   RecentMatches$matches[[m]]$lane == matchInfo[[m]]$participants[[n]]$timeline$lane){
  participantID <<- vector(length = 20)
  participantID[[m]] <<- n} 
  }}

participantID
matchID
goldEarnedDelta
creeps.med

barplot(num.creep, main="Creeps por Min.", 
        xlab="Delta t", ylab='Creeps')


for(i in 1:20){
  creeps.med <<- list(length=20)
  cp <<- matchInfo[[20]]$participants[[9]]$timeline$creepsPerMinDeltas
  creep <- list(cp[2],cp[1],cp[4],cp[3])
  creeps.med[[i]] <<- unlist(creep)}

