*** Settings ***
Documentation       This resource file contains base settings and libraries for the project.

Resource            ../../framework/framework_resources/base_common_resources.resource
Resource            ../../business/hooks/login/login_hooks.resource
Resource            ../../business/hooks/products/products_hooks.resource
Resource            ../../business/hooks/carts/carts_hooks.resource
Resource            ../../business/hooks/mock/login_hooks_mock.resource


*** Variables ***
${CREATED_STATUS}=                  201
${SUCCESS_STATUS}=                  200
${NOT_FOUND_STATUS}=                404
${DUPLICATED_STATUS}=               400
${INVALID_DATA_STATUS}=             401
${SUCCESS_LOGIN_MESSAGE}=           Login realizado com sucesso
${SUCCESS_CREATED_MESSAGE}=         Cadastro realizado com sucesso
${EMAIL_IN_USE_MESSAGE}=            Este email já está sendo usado
${EXCLUDED_RECORD_SUCCESS}=         Registro excluído com sucesso
${UPDATED_RECORD_SUCCESS}=          Registro alterado com sucesso
${NO_EXCLUDED_RECORD}=              Nenhum registro excluído
${USER_WITH_REGISTERED_CART}=       Não é permitido excluir usuário com carrinho cadastrado
${PRODUCT_IN_REGISTERED_CART}=      Não é permitido excluir produto que faz parte de carrinho
${EXPIRED_TOKEN}=                   Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
${ADMIN_ROUTE}=                     Rota exclusiva para administradores
${DUPLICATED_PRODUCT}=              Já existe produto com esse nome
${DUPLICATED_PRODUCT_IN_CART}=      Não é permitido possuir produto duplicado
${DUPLICATD_CART_PER_USER}=         Não é permitido ter mais de 1 carrinho
${PRODUCT_NOT_FOUND}=               Produto não encontrado
${PRODUCT_QTY_NOT_ENOUGH}=          Produto não possui quantidade suficiente
${CART_NOT_FOUND}=                  Carrinho não encontrado
${NOT_FOUND_CART_FOR_USER}=         Não foi encontrado carrinho para esse usuário
${LOGIN_401}=                       Email e/ou senha inválidos
${AUTH_KEY}=                        authorization
${MESSAGE_KEY}=                     message
${ID_KEY}=                          _id
${USER_ID_KEY}=                     idUsuario
${CART_TOTAL_QTY_KEY}=              quantidadeTotal
&{REQ_METHODS}=                     GET=get    POST=post    PUT=put    DELETE=delete
&{COMM_MESSAGE}=                    SUCCESS=success    ERROR=error
