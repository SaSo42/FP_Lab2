port module Ports exposing (..)

import Json.Encode as E exposing (Value)
import Json.Decode as D exposing (Decoder)
import Json.Decode.Pipeline exposing (required, optional, hardcoded)
import Actions exposing (..)
import State exposing (Note)
import Debug

--send:
port cache: E.Value -> Cmd msg
port persistNotes: E.Value -> Cmd msg
port getNotes: String -> Cmd msg

--receive:
port randomExampleTextToElm: (Value -> msg) -> Sub msg
port receiveNotes: (Value -> msg) -> Sub msg

noteDecoder : Decoder Note
noteDecoder =
  D.map3 Note
      (D.field "id" D.int)
      (D.field "title" D.string)
      (D.field "body" D.string)

decodeNoteValue: Value -> Action
decodeNoteValue val =
    let
        result = D.decodeValue (D.list noteDecoder) val
    in
        case result of
            Ok notes ->
                RECEIVE_NOTES notes
            Err _ ->
                UPDATE_STRING (Debug.toString result)

decodeValue: Value -> Action
decodeValue x =
    let
        result = D.decodeValue D.string x
    in
        case result of
            Ok string ->
                UPDATE_STRING string
            Err _ ->
                UPDATE_STRING "Silly JavaScript, you can't kill me!"