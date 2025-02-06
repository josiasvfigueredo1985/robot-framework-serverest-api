*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    requests
Resource  base.test.robot
Resource   base.config.variables.resource
Resource    ../requests/requests.methods.robot
Library    ../../framework/utils/RestUtils.py