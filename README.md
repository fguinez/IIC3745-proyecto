# Proyecto DCCinema Grupo 10
#### Entrega: 3
#### Url Heroku: https://iic3745-proyecto.herokuapp.com/


### Logros
 
- Se construyó el CRUD que representa los productos en la tienda. 
- Se implementó la vista que despliega todos los productos. Además es posible filtrar los productos por las categorías que escoja el usuario.
- No existen ofensas de rubocop.
- Se implementaron los tests unitarios y de integración los cuales suman en conjunto 91 tests.
- Existe un 100% de coverage. 
- Se actualizó el deploy a Heroku.

### Tabla de Decisión: Formulario para ver cartelera

|  Inputs   | R1        | R2 | R3 | R4 | R5 | R6 | R7 | R8 |
|---------  |:--:       |:--:|:--:|:--:|:--:|:--:|:--:|:--: |
|  Sucursal | Regional  | Regional   | Regional   | Regional   | Santiago  | Santiago   | Santiago   | Santiago   |
| Idioma    | ES        | ES         | EN         | EN         | ES        | ES         | EN         | EN         |
| Edad      | +=18      | -18        | +=18       | -18        | +=18      | -18        | +=18       | -18        |
| **Outputs**               |    |     |    |     |    |     |    |     |
| Mostrar sucursal Regional | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Mostrar sucursal Santiago | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ | ✅ | ✅ |
| Orden de las películas | 🇪🇸🇺🇸 | 🇪🇸🇺🇸 | 🇺🇸🇪🇸 | 🇺🇸🇪🇸 | 🇪🇸🇺🇸 | 🇪🇸🇺🇸 | 🇺🇸🇪🇸 | 🇺🇸🇪🇸 |
| Mostrar peliculas aptas para menores de edad | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Mostrar peliculas no aptas para menores de edad | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ |


### Consideraciones generales para la correcion

- Adicionalmente a los atributos solicitados para productos, se consideró que estos deben tener un nombre asociado.

