#!/bin/bash

# Create shared resources directories
mkdir -p MKDOCS-System-OOD/shared_resources/images
mkdir -p MKDOCS-System-OOD/shared_resources/requirements/functional
mkdir -p MKDOCS-System-OOD/shared_resources/requirements/security
mkdir -p MKDOCS-System-OOD/shared_resources/services/SIEM/diagrams

# Create directories for two example systems: SystemA and SystemB
for system in SystemA SystemB; do
    mkdir -p MKDOCS-System-OOD/$system
    echo "# $system System Design Documentation" > MKDOCS-System-OOD/$system/SDD.md
    mkdir -p MKDOCS-System-OOD/$system/images
    
    # Create directories for two example components: Component1 and Component2
    for component in Component1 Component2; do
        subsystem="subsystem${component: -1}" # Derive subsystem name from component name
        mkdir -p MKDOCS-System-OOD/$system/components/$subsystem
        echo "# Detailed Design for $component of $system" > MKDOCS-System-OOD/$system/components/$subsystem/DD.md
        mkdir -p MKDOCS-System-OOD/$system/components/$subsystem/diagrams
    done
done

echo "Folder structure created successfully!"
