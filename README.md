# MKDOCS-System-OOD

This projects aim is to assist in creating a a "docs as codes" solution utilising common devops tools and methodolgies such as object orientated programming or in this case object orientated documentation. 

The primary compontents of this project are: 

- Ansible for orchestration
- GIT for version control
- MKDOCS for publishing
- Jinja2 for templating
- Markdown for documentation
- YAML data formating

## Requirements

A new git repository for version control of the documentation, it must not be initiated as this is completed by the inital deployment. 

A NGINX server for site hosting however, you can run this locally but this is not recommended. 

A development box to pull this repo and start the project/host your docs. 


## Key Files



Use this command to build the site ``` xvfb-run -a mkdocs build ```
