#!/bin/bash
ansible-vault --vault-password-file ./vault.txt encrypt_string $1
