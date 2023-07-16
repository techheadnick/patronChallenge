# PatronManager Coding Challenge

This git repository contains a "blank" SFDX project to serve as the starting point for the tasks outlined in the coding challenge instructions.

While Visualforce has its limitations, it is a satisfactory and simple choice for building the UI for the solution. Building the same UI in LWC would consume too much time and the Apex implementation is where you should prioritize your time.

## Deployment

```
git clone https://github.com/techheadnick/patronChallenge.git
cd pm-coding-challenge
sfdx org:create:scratch -f config/project-scratch-def.json -d
sfdx force:source:push
```

## Service Config
Once the Application has been pushed to your org you will need to setup your API key for mapQuest. First Add your profile/user to NamedCredentials Permission Set. This step is left manual by design.
Then Add the API key to the External Credential. You can do this by opening the Principal associated with the External Credential 'MapQuestApiKey' and inserting the API Key value in the Authorization Parameter for LocationApiKey

<img width="425" alt="image" src="https://github.com/techheadnick/patronChallenge/assets/29713250/dfb5444a-9a99-41f4-9e73-8976025a196f">

## UI
From the Sales app, click the Weather tab to get started!

##Incomplete Tasks:
**Displaying an error when city information is not retrieved**. This proved to be more complicated than I expected due to there being a default city that is returning regardless of input. I have some ideas for this but
did not feel it was worth the time investment up front. 
**Excluding multiple entries of the same city**. Should this be limited to only the loc/lat combination being unique or is any value containing the city state sufficient? This has a complicated answer because if the user
inputs a very specific location when searching for a city for the first time IE:(1234 street City, State zip code) then the lat/lng will be off from what someone would consider if only inputting the "City/state" combination. Do we want to validate on input that it only contains city and state in the search? If so the validation may be complicated but is a possibility.
**Retrieving the weather data and displaying it on a dashboard.**
**Testing one of the methods.**
