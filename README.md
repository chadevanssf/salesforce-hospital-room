# salesforce-hospital-room

Providing the business side of the Alexa interface for Hospital Room Manager.

## Installation Order

1. Install Salesforce backend (this project)
1. Install Heroku app (see [https://github.com/chadevanssf/alexa-hospital-room](https://github.com/chadevanssf/alexa-hospital-room))
1. Install Alexa Skill (see above)

## Installation Instructions

### Salesforce DX (SFDX) CLI

1. Authenticate with your hub org (if not already done):
    ```
    sfdx force:auth:web:login --setdefaultdevhubusername --setalias myhuborg
    ```

1. Clone the salesforce-hospital-room repository:
    ```
    git clone https://github.com/chadevanssf/salesforce-hospital-room
    cd salesforce-hospital-room
    ```

1. Create a scratch org and provide it with an alias (hrm):
    ```
    sfdx force:org:create --definitionfile config/project-scratch-def.json --setdefaultusername --setalias hrm
    ```

1. Push the app to your scratch org:
    ```
    sfdx force:source:push
    ```

1. Assign the Hospital_Room_Manager permission set to the default user:
    ```
    sfdx force:user:permset:assign --permsetname Hospital_Room_Manager
    ```

1. Load sample data:
    ```
    sfdx force:data:tree:import --plan ./data/Hospital_Room__c-plan.json
    ```

1. Open the scratch org:
    ```
    sfdx force:org:open
    ```

1. Activate Process Buider flow: "Alexa Update Status"


### Salesforce DX (SFDX) in the Cloud

Deploy using SFDX, click the button below:

[![Deploy](https://deploy-to-sfdx.com/dist/assets/images/DeployToSFDX.svg)](https://deploy-to-sfdx.com/deploy?template=https://github.com/chadevanssf/salesforce-hospital-room)

### Salesforce Package in the Cloud

1. Deploy via Metadata API, click the button below

  <a href="https://githubsfdeploy.herokuapp.com"><img alt="Deploy to Salesforce"         src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png"></a>

1. Use Import Wizard to import the data:

  force-ide/data/hospital_rooms.csv

## Helpful commands

* Convert MDAPI format (e.g. Force IDE) into SFDX format:
  ```
  sfdx force:mdapi:convert --rootdir ./force-ide/src/
  ```
  * see [https://developer.salesforce.com/blogs/developer-relations/2017/07/migrating-existing-projects-salesforce-dx.html](https://developer.salesforce.com/blogs/developer-relations/2017/07/migrating-existing-projects-salesforce-dx.html)
  * FYI: run in the root folder of the eclipse project, files end up in ./force-app/main/default/ folder structure.

* Convert SFDX format into MDAPI (e.g. Force IDE format):
  ```
  sfdx force:source:convert --outputdir ./force-ide/src/ --packagename hospital-room-manager
  ```

* Deploy MDAPI to a non-scratch org:
  ```
  sfdx force:auth:web:login --setalias hrm-org
  sfdx force:mdapi:deploy --deploydir ./force-ide/src/ --targetusername hrm-org --wait 2
  ```
  Load the data and assign the permission set manually

* Export the latest data
  ```
  sfdx force:data:tree:export --outputdir ./data --query ./data/Hospital_Room__c-query.soql --plan
  ```
