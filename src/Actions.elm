module Actions exposing (..)
import State exposing (Note)

type Action = ADD | CHANGE_TITLE String | CHANGE_BODY String | DELETE_NOTE Int | SAVE_TITLE_TO_DB| UPDATE_STRING String | GET_NOTES_FROM_DB | RECEIVE_NOTES (List Note)| NONE