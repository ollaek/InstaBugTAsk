# README

This Branch contains what I could do in this short time before my Umra ( may Allah pless you all with this visit )

Sorry for what you are going to walk through but this is me forst time using rails so I tried my best to complete as much requiremnets as I can 

# APIs:

Create Application: 
Post http://localhost:3000/api/v1/applications 
Body {
      "name":""
     }

Create Chat:
Post http://localhost:3000/api/v1/applications/{ApplicationToken}/chats

Get Chat:
Get http://localhost:3000/api/v1/applications/{ApplicationToken}/chats/{ChatId}

Add Message:
Post http://localhost:3000/api/v1/applications/{ApplicationToken}/{ChatId}/messages
body {
    "message":"test message"
}

search:
Get http://localhost:3000/api/v1/applications/{ApplicationToken}/{ChatId}/messages/search?query={searchToken}


Issues that faced me: 
-spent a whole day trying to configure ruby an win and i decieded to go with ubuntu instead  
- kibbana wasn't launching n ubuntu idk why so i couldn't test the search api
- docker couldn't be installed env issue i guess but i added the docker and compose files
- returning data from apis to hide Ids I coulnd't find out how to di it , but from my experience with .Net all i need to do is tocreate a DTO and mapp the entities to it and return the dtos instead
