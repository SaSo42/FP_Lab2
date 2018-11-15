module Head exposing (..)

import Html exposing (div, a, form, text, nav, span, input, label, p, button)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick)
import Actions exposing (..)

renderHeader state =
    nav [class "blue"][
        div [class "brand-logo center"][text "My new Lab-Note-App"],
        div [class "purple-stuff"][
            button [onClick SAVE_TITLE_TO_DB][text state.extraRandomText],
            button [onClick GET_NOTES_FROM_DB][text state.loadStatus],
            div [][text state.extraRandomText]
        ]
    ]