*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    requests
Library    JSONLibrary
Resource  ../rest/base.rest.robot
Resource   base.config.variables.resource
Resource    ../../framework/rest/base.request.api.robot
Library    ../../framework/utils/rest_utils.py