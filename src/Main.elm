import Browser
import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (class, attribute, property, value, placeholder, style)
import Html.Events exposing (onClick, onInput)
import VirtualDom exposing (node, Attribute, Node)


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model =
  { content : String
  , qty: Int
  }

init : Model
init = Model "" 11


-- UPDATE

type Msg = Change String | Increase | Decrease

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }
    Increase -> {model | qty = model.qty + 1}
    Decrease -> {model | qty = model.qty - 1}


-- VIEW

view : Model -> Html Msg
view model =
  customScrollBar [ class "content" ]
    (buttons :: (List.repeat model.qty section))

buttons: Html Msg
buttons = 
  div [ style "display" "flex", style "flex-direction" "row", style "justify-content" "space-around" ]
    [ button [ onClick Increase] [ text "increase" ]
    , button [ onClick Decrease] [ text "decrease" ]
    ]

defaultText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan placerat lectus, in euismod estpulvinarvitae. Integer sagittis mattis semper. Pellentesque feugiat ligula non ex bibendum, vel tristiqueliberolacinia. Morbi in mi nec turpis sollicitudin varius. Aliquam erat volutpat. Curabitur in elementum mi,sedullamcorper erat. Donec pellentesque ipsum id lorem convallis, at faucibus diam tincidunt. Sed iaculissitametquam sit amet gravida. Etiam lacinia purus nunc, in tempor lacus iaculis vitae."

customScrollBar : List (Attribute msg) -> List (Node msg) -> Node msg
customScrollBar =
  node "custom-scrollbar"

section = 
  div [ class "section" ]
    [ text defaultText ]