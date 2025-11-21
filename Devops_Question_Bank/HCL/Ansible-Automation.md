# Ansible / Automation – HCL Interview Questions

## Q1. Which tools do you use for pipeline?
### Answer
We use Azure DevOps Pipelines, GitHub Actions, and occasionally Ansible for configuration management or post-provision tasks.
### Follow-Up Points
- Ansible is agentless  
- Good for VM configuration  
- Works with YAML playbooks  
- Integrates with Terraform workflows
### Example
ansible-playbook -i hosts site.yaml

