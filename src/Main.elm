module App exposing (main)

import Html exposing (div, a, form, text, nav, span, input, label, p)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onInput, onClick)
import Browser
import Reducer exposing (reducer)
import State exposing (..)
import Actions exposing (..)
import Ports exposing (..)
import Head exposing (renderHeader)
import AddNote exposing (renderAddNote)
import ListNotes exposing (renderNoteList)
import Json.Encode as E

render state =
    div[class "row"][
        renderHeader state,
        div [class "container row"][
            renderAddNote state,
            renderNoteList state
        ]
    ]

subscriptions : State -> Sub Action
subscriptions model =  Sub.batch
    [
        randomExampleTextToElm (decodeValue),
        receiveNotes (decodeNoteValue)
    ]

main = Browser.element {
        init = init,
        update = reducer,
        view = render,
        subscriptions = subscriptions
    }