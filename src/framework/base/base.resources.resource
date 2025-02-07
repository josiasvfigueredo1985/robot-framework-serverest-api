*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    requests
Library    JSONLibrary
Resource  base.test.robot
Resource   base.config.variables.resource
Resource    ../../framework/rest/base.rest.api.robot
Library    ../../framework/utils/RestUtils.py