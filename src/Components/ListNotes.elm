module ListNotes exposing (..)

import Html exposing (div, a, form, text, nav, span, input, label, p)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onInput, onClick)
import Actions exposing (..)
import Note exposing (renderNote)

renderNoteList state =
    p[class "row"][
        div [] (List.map renderNote state.notes)
    ]