#!/bin/bash

emacsclient -a "" -c -n --eval "(require 'ediff)" --eval "(ediff-files \"$1\" \"$2\")"
