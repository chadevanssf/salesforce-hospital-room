# salesforce-hospital-room

Providing the business side of the Alexa interface for Hospital Room Manager.

## Alexa and Heroku Front End

See [https://github.com/chadevanssf/alexa-hospital-room](https://github.com/chadevanssf/alexa-hospital-room) for Alexa and Heroku front end installation.

## Installation Instructions

1. Authenticate with your hub org (if not already done):
    ```
    sfdx force:auth:web:login -d -a myhuborg
    ```

1. Clone the salesforce-hospital-room repository:
    ```
    git clone https://github.com/chadevanssf/salesforce-hospital-room
    cd salesforce-hospital-room
    ```

1. Create a scratch org and provide it with an alias (hrm):
    ```
    sfdx force:org:create -s -f config/project-scratch-def.json -a hrm
    ```

1. Push the app to your scratch org:
    ```
    sfdx force:source:push
    ```

1. **TODO** Assign the nto permission set to the default user:
    ```
    sfdx force:user:permset:assign -n nto
    ```

1. **TODO** Load sample data:
    ```
    sfdx force:data:tree:import --plan ./data/sample-data-Merchandise__c-plan.json
    ```

1. Open the scratch org:
    ```
    sfdx force:org:open
    ```

Or, deploy to SFDX using the button below:

[![Deploy](https://deploy-to-sfdx.com/dist/assets/images/DeployToSFDX.svg)](https://deploy-to-sfdx.com/deploy?template=https://github.com/chadevanssf/salesforce-hospital-room)

## Helpful commands

* Convert source code (e.g. eclipse extract) into SFDX format:
  ```sh
  sfdx force:mdapi:convert -r ./src
  ```
  * see [https://developer.salesforce.com/blogs/developer-relations/2017/07/migrating-existing-projects-salesforce-dx.html](https://developer.salesforce.com/blogs/developer-relations/2017/07/migrating-existing-projects-salesforce-dx.html)
  * FYI: run in the root folder of the eclipse project, files end up in ./force-app/main/default/ folder structure.
