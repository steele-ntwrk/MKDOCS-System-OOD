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
  - [[mkdocs-drawio-exporter](https://github.com/LukeCarrier/mkdocs-drawio-exporter)] for svg diagram embedding into html
  - [[mkdocs-macros](https://mkdocs-macros-plugin.readthedocs.io/en/latest/)] enables the ability to create macros that dynamically pull information from sources such as netbox. 
  - [[mkdocs-include-markdown-plugin](https://github.com/mondeja/mkdocs-include-markdown-plugin)] to include sections of other markdown files

## Nomenclature

- Control Node: The node where OoDoc resides and where control of the project is executed.
- Project: The project that is being documented, commonly used term is project repo.
- Project Repo: The git repository that is used/gerneted by the control node

## Requirements

A new git repository for version control of the documentation, it must not be initiated as this is completed by the inital deployment. 

A NGINX server for site hosting however, you can run this locally but this is not recommended. 

A development box to pull this repo and start the project/host your docs. 


## Key Files

| Role           | Template/var | Input File               | Description                                                                        | Output Files              |
| -------------- | ------------ | ------------------------ | ---------------------------------------------------------------------------------- | ------------------------- |
| Control Node   | var          | `mkdocs_build.yml`       | General vars for the project and project repo                                      | NA                        |
| Control Node   | var          | `requirements`           | Requirements for the project                                                       | `*requirements.md* `      |
| Control Node   | var          | `secret.yml`             | Ansible secrets used by the control node such as git un/pw, netbox api etc.        | NA                        |
| Control Node   | var          | `sos_master.yml`         | System heirarchy structure and supporting folders                                  | `*system dirs and files*` |
| Control node   | Template     | `*detailed_design.md.j2` | Templates to render markdown pages for Systems                                     | `*system_file.md*`        |
| Control node   | Template     | `*requirement.md.j2`     | Templates to render markdown pages for Requirements                                | `*requirement.md*`        |
| Control node   | Template     | `index.md.j2`            | Project index page                                                                 | `index.md`                |
| Control node   | Template     | `mkdocs.yml.j2`          | Project mkdocs configuration file                                                  | `mkdocs.yml`              |
| nginx          | var          | `main.yml`               | Genral vars for the hosting web server including project path to store the project | NA                        |
| nginx          | var          | `secret.yml`             | Secrets for nginx node                                                             | NA                        |
| nginx          | Template     | `nginx.conf.j2`          | Renders nginx configuration                                                        | `nginx.conf`              |
| NA (Inventory) | NA           | `Inventory.ini`          | Control and nginx host specification                                               | NA                        |



Use this command to build the site ``` xvfb-run -a mkdocs build ```


## Key playbooks

Run main.yml on initiation, note if the project repo has a remote origin the init commit will not run. 

Run tempalte_update.yml to update templates, this will create a template branch and push to remote project repo. Template update branch only viewable on control node

## TAGS

| TAG                            | Action                                                                          |
| ------------------------------ | ------------------------------------------------------------------------------- |
| update_project_mkdocs_template | Updates project mkdocs.yml file with the new template                           |
| push_project_update            | Pushes the latest version of the project to git ann the web server              |
| update_project_systems         | Updates directory, files and mkdocs.yml file with any updates to sos_master.yml |
| update_project_template        | Automatically render file templates into a temporary branch to be mergded       |
| init                           | Used to initiate the project (Note: Wont work after the first time)             |

## Instructions on 