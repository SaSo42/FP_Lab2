module Note exposing (..)

import Html exposing (div, a, form, text, nav, span, input, label, p)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onInput, onClick)
import Actions exposing (..)

renderNote {id, title, body} =
    let
        handleDelete = DELETE_NOTE id
    in
        div [class "card"][
            div [class "card-content"][
                p [class "card-title"][text title],
                p [][text body],
                div [class "card-action"][
                    a [onClick handleDelete][text "remove"]
                ]
            ]
        ]
