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

En `http://bencinas.mlavandero.org/precios`. se obtienen todos los datos posibles.

Para obtener un dato en particular, `http://bencinas.mlavandero.org/precios/:id`

Se agrego la informacion de los combustibles.  Para mantener los recursos de manera RESTful, se agregan las siguientes
rutas:

* `http://bencinas.mlavandero.org/combustibles/:slug\_o\_id/precios`
* `http://bencinas.mlavandero.org/combustibles/:slug\_o\_id/precios/:id`

## Desarrollo

Se puede hacer Fork al proyecto, se aceptan Pull Requests.

Se dejo de usar Capybara y Webkit para obtener los datos.  Se ocupa Mechanize y Nokogiri.

## Agradecimientos

Se hace un especial agradecimiento a @gody por haber aportado el código para realizar la actualización de los
datos.

Revisen su App para iPhone en https://itunes.apple.com/us/app/bikemymoney/id578414850?mt=8
