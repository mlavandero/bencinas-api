#bencinas-api

[![Build Status](https://travis-ci.org/mlavandero/bencinas-api.png)](https://travis-ci.org/mlavandero/bencinas-api)

API que entrega la información del precio de la bencina en Chile.

Se quiere tener una API simple, tipo REST y que devuelva JSON para ser usadas en otras aplicaciones
o sitios web.

Por el momento solo tiene configurada la información para la Región Metropolitana (RM) y toma los datos
de todas las comunas.

Revisar en la sección Issues las siguientes actualizaciones.

## Uso

Es necesario especificar que se solicita un recurso de tipo json, agregando un .json al final de los request.

En `http://bencinas.mlavandero.org/informaciones_bencina`. se obtienen todos los datos posibles.

Para obtener un dato en particular, `http://bencinas.mlavandero.org/informaciones_bencina/:id`

Se agrego la informacion de los combustibles.  Para mantener los recursos de manera RESTful, se agregan las siguientes
rutas:

* `http://bencinas.mlavandero.org/combustibles/:slug\_o\_id/informaciones_bencina`
* `http://bencinas.mlavandero.org/combustibles/:slug\_o\_id/informaciones_bencina/:id`

## Desarrollo

Se puede hacer Fork al proyecto, se aceptan Pull Requests.

Es posible que sea necesario instalar la libreria Qt para utilizar Capybara-Webkit, para información de como instalarlo
revisar https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit

## Agradecimientos

Se hace un especial agradecimiento a @gody por haber aportado el código para realizar la actualización de los
datos.

Revisen su App para iPhone en https://itunes.apple.com/us/app/bikemymoney/id578414850?mt=8
