module Reducer exposing (reducer)

import Actions exposing (..)
import Random exposing (step)
import State exposing (..)
import List
import  Maybe exposing (withDefault)
import Ports exposing (..)
import Json.Encode as E

addNote: List Note -> Int -> String -> String -> List Note
addNote notes id title body =
        List.append notes [createNote id title body]

createNote: Int -> String -> String -> Note
createNote id title body = {
        id = id,
        title = title,
        body = body
    }

isNotNote: Int -> Note -> Bool
isNotNote id note = not (id == note.id)

getListOfTuplesOfNoteRecord: Note -> List (String, E.Value)
getListOfTuplesOfNoteRecord note = [
        ("id", E.int note.id),
        ("title", E.string note.title),
        ("body", E.string note.body)
    ]

getListOfListOfTuplesOfNoteRecords: List Note -> List ( List (String, E.Value) )
getListOfListOfTuplesOfNoteRecords notes = List.map getListOfTuplesOfNoteRecord notes

reducer action state = case action of
    CHANGE_TITLE title -> ({state | title = title}, Cmd.none)
    CHANGE_BODY body -> ({state | body = body}, Cmd.none)
    ADD ->
        let
           id = List.length state.notes
           newNote = createNote id state.title state.body
           newNoteList = List.append state.notes [newNote]
           temp = getListOfListOfTuplesOfNoteRecords newNoteList
        in
            ({state |
                notes = addNote state.notes id state.title state.body,
                title = "",
                body = ""
            }, persistNotes (E.list E.object temp))
    DELETE_NOTE id ->
        let
            notThisNote = isNotNote id
        in
            ({state |
               notes = List.filter notThisNote state.notes
            }, Cmd.none)
    SAVE_TITLE_TO_DB -> ({state | extraRandomText = "Loading..."}, cache (E.string state.title) )
    GET_NOTES_FROM_DB -> (state, getNotes "Do not mind...")
    RECEIVE_NOTES notes -> ({state | notes = notes}, Cmd.none)
    UPDATE_STRING result -> ({state | extraRandomText = result}, Cmd.none )
    _ -> (state, Cmd.none)