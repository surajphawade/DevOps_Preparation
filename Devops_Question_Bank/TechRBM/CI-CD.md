# Azure DevOps / CI-CD – TechRBM Interview Questions

## Q1. How to set up a self-hosted agent if we have a machine?
### Answer
Download the Azure Pipelines agent package on the machine, configure with a PAT (personal access token) and register the agent to an agent pool in the Azure DevOps project. Ensure required tools and permissions are installed.
### Follow-Up Points
- Keep agent updated and secure.  
- Use service accounts and limit network exposure.  
- Configure auto-start service for the agent.
### Example
./config.sh --url https://dev.azure.com/org --auth pat --token <PAT>

---

## Q2. How to access secure values in pipeline?
### Answer
Use secret variables, variable groups linked to Key Vault, or service connections. Avoid printing secrets to logs. Use Managed Identity or service principals for non-interactive auth.
### Follow-Up Points
- Use Azure Key Vault task for runtime retrieval.  
- Mask variables in logs and rotate them periodically.
### Example
- task: AzureKeyVault@2  inputs: KeyVaultName: 'kv-name' SecretsFilter: '*'

---

## Q3. I want to skip one CI/CD step — how?
### Answer
Use `condition:` in pipeline YAML or wrap step execution in an if-check. Use environment variables or pipeline parameters to toggle steps.
### Follow-Up Points
- Use conditions to make steps dynamic.  
- Avoid removing steps — use flags to skip in different branches/environments.
### Example
- script: echo "step"  condition: and(succeeded(), ne(variables['SkipStep'], 'true'))

