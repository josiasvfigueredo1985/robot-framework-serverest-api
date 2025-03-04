*** Settings ***
Documentation       This resource file contains base settings and libraries for the project.

Library             Collections
Library             JSONLibrary
Resource            ../../business/hooks/login/login_hooks.resource
Resource            ../../business/hooks/products/products_hooks.resource
Resource            ../../business/hooks/carts/carts_hooks.resource
Resource            ../../business/hooks/authentication/authentication_hooks.resource
