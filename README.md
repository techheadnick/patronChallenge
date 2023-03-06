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

## UI
From the Sales app, click the Weather tab to get started!