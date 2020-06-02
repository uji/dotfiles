#!/bin/sh
vim -c 'call minpac#clean()' -c 'call minpac#update("", {"do": "quit"})'
