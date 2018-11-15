module State exposing (..)

initialState = {
        notes = [],
        title = "",
        body = "",
        extraRandomText = "to be randomed",
        loadStatus = "Tap to sync with DB"
    }

type alias Note = {
        id: Int,
        title: String,
        body: String
    }

type alias State = {
        notes: List Note,
        title: String,
        body: String,
        extraRandomText: String,
        loadStatus: String
    }

init: Maybe Int -> ( State, Cmd msg )
init flags = (
        initialState,
        Cmd.none
    )