library(httr)

oauth_endpoints("github")

myapp <- oauth_app("github", key="1226857e0bf010d82feb", secret="4249beb95652721532982a63e911354bdae95b11")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=F)

gtoken <- config(token = github_token)
data <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(data)
content(data)

json1 <- content(data)
json2 <- jsonlite::fromJSON(toJSON(json1))
head(json2)