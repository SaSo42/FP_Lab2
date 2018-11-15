module AddNote exposing (..)

import Html exposing (div, a, form, text, nav, span, input, label, p)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onInput, onClick)
import Actions exposing (..)

renderAddNote state =
    p [][
        div [class "input-field col s6"][
            input [type_ "text", onInput CHANGE_TITLE, value state.title][],
            label [][text "title"]
        ],
        div [class "input-field col s6"][
            input [type_ "text", onInput CHANGE_BODY, value state.body][],
            label [][text "note"]
        ],
        a [class "purple-stuff btn-large z-depth-0", onClick ADD][text "add"]
    ]
