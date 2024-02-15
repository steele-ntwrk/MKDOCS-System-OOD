# OoDoc

OoDoc ia a projects that aims to assist in creating a "docs as code" solution utilising common devops tools and methodolgies such as object orientated programming or in this case object orientated documentation.

The primary compontents of this project are:

- Ansible for orchestration
- GIT for version control
- MKDOCS for publishing
- Jinja2 for templating
- Markdown for documentation
- YAML data formating
- MKDOCS Plugins
  - [[mkdocs-material](https://squidfunk.github.io/mkdocs-material/)] for modern theme and page enhancements
  - [[mkdocs-drawio-exporter](https://github.com/LukeCarrier/mkdocs-drawio-exporter)] for diagram svg embedding into html

## Nomenclature

- Control Node: The node where OoDoc resides and where control of the project is executed.
- Project: The project that is being documented, commonly used term is project repo.
- Project Repo: The git repository that is used/gerneted by the control node

## Requirements

A new git repository for version control of the documentation, it must not be initiated as this is completed by the inital deployment. 

A NGINX server for site hosting however, you can run this locally but this is not recommended. 

A development box to pull this repo and start the project/host your docs. 


## Key Files



Use this command to build the site ``` xvfb-run -a mkdocs build ```


## Key playbooks

Run main.yml on initiation, note if the project repo has a remote origin the init commit will not run. 

Run tempalte_update.yml to update templates, create a template branch and push to remote origion. Template update branch only viewable on control node

## TAGS

| TAG | Action |
|-------|----------|
| update_project_mkdocs_template | Updates project mkdocs.yml file with the new template |
| push_project_update | Pushes the latest version of the project to the web server |
| update_project_systems | Updates directory, files and mkdocs.yml file with any updates to sos_master.yml |

