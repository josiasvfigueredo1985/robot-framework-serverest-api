*** Settings ***
Documentation       This resource file contains base settings and libraries for the project.

Library             Collections
Library             JSONLibrary
Resource            ../../business/hooks/login/login_hooks.resource
Resource            ../../business/hooks/usuarios/usuario_hooks.resource
Resource            ../../business/hooks/authentication/authentication_hooks.resource
