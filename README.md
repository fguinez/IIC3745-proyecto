# Proyecto DCCinema Grupo 10
#### Entrega: 3
#### Url Heroku: https://iic3745-proyecto.herokuapp.com/


### Logros
 
- Se modificó el formulario solicitado añadiendo edad, sucursal e idioma.
- Solo se despliegan las películas de la sucursal indicada y aptas para la edad del solicitante.
- Las películas son desplegadas posicionando en primer lugar las del idioma de preferencia.
- Se creó una tabla de decisión sobre el formulario solicitado (la cual se encuentra en la siguiente sección).
- Se crearon 8 tests de sistema utiliando Capybara. Los cuales prueban todas las reglas expuestas en la tabla de decisión.
- No existen ofensas de rubocop.
- Se agregaros los tests unitarios y de integración debido a las nuevas funcionalidades. En total llegan a la suma de 103 tests.
- Existe un 100% de coverage. 
- Se actualizó el deploy a Heroku.

### Tabla de Decisión: Formulario para ver cartelera

|  Inputs   | R1        | R2 | R3 | R4 | R5 | R6 | R7 | R8 |
|---------  |:--:       |:--:|:--:|:--:|:--:|:--:|:--:|:--: |
|  Sucursal | Regional  | Regional   | Regional   | Regional   | Santiago  | Santiago   | Santiago   | Santiago   |
| Idioma    | ES        | ES         | EN         | EN         | ES        | ES         | EN         | EN         |
| Edad      | +=18      | -18        | +=18       | -18        | +=18      | -18        | +=18       | -18        |
| **Outputs**               |    |     |    |     |    |     |    |     |
| Mostrar películas en sucursal Regional | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Mostrar películas en sucursal Santiago | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ | ✅ | ✅ |
| Orden de las películas | 🇪🇸🇺🇸 | 🇪🇸🇺🇸 | 🇺🇸🇪🇸 | 🇺🇸🇪🇸 | 🇪🇸🇺🇸 | 🇪🇸🇺🇸 | 🇺🇸🇪🇸 | 🇺🇸🇪🇸 |
| Mostrar peliculas aptas para menores de edad | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Mostrar peliculas no aptas para menores de edad | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ |

- ✅ = Si se muestra
- ❌ = No se muestra
- 🇪🇸🇺🇸 = Primero películas en español y luego películas en inglés
- 🇺🇸🇪🇸 = Primero películas en inglés y luego películas en español

### Consideraciones generales para la correcion

- Entrega 2:
    - Adicionalmente a los atributos solicitados para productos, se consideró que estos deben tener un nombre asociado.

