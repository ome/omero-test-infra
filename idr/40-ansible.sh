#!/usr/bin/env bash
ansible-playbook \
        -i localhost \
	-e retry_files_enabled=False \
	-e ansible_connection=local \
	-e ansible_gather_facts=False \
	idr.yml
