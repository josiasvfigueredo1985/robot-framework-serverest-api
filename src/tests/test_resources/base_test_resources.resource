*** Settings ***
Documentation       This resource file contains base settings and libraries for the project.

Library             Collections
Resource            ../../business/hooks/login/login_hooks.resource
Resource            ../../business/hooks/products/products_hooks.resource
Resource            ../../business/hooks/carts/carts_hooks.resource


*** Variables ***
${CREATED_STATUS}=              201
${SUCCESS_STATUS}=              200
${SUCCESS_LOGIN_MESSAGE}=       Login realizado com sucesso
${SUCCESS_CREATED_MESSAGE}      Cadastro realizado com sucesso
${AUTH_KEY}=                    authorization
${MESSAGE_KEY}=                 message
${ID_KEY}=                      _id
${USER_ID_KEY}=                 idUsuario
${CART_TOTAL_QTY_KEY}=          quantidadeTotal
&{REQ_METHODS}                  GET=get    POST=post    PUT=put    DELETE=delete
&{COMM_MESSAGE}                 SUCCESS=success    ERROR=error
