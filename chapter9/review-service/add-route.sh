#!/bin/bash

oc set env dc/backend \
    --prefix=DATABASE_ \
    --from=cm/todoapp
    
