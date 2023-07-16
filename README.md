# PatronManager Coding Challenge

This git repository contains a "blank" SFDX project to serve as the starting point for the tasks outlined in the coding challenge instructions.

While Visualforce has its limitations, it is a satisfactory and simple choice for building the UI for the solution. Building the same UI in LWC would consume too much time and the Apex implementation is where you should prioritize your time.

## Deployment

```
git clone git@github.com:patronmanager/pm-coding-challenge.git
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
