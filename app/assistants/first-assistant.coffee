# this  is the  creator function  for your  scene assistant  object. It  will be
# passed all the  additional parameters (after the scene name)  that were passed
# to pushScene. The reference to  the scene controller (@controller) has not
# be  established yet,  so any  initialization that  needs the  scene controller
# should be done in the setup function below.
class FirstAssistant
  setup: ->
    @total = 0
    @controller.get("count").update(@total)

    @buttonAttributes = {}

    @buttonModel = 
      label:        "TAP HERE",
      buttonClass:  "",
      disabled:     false

    @controller.setupWidget "MyButton", @buttonAttributes, @buttonModel

    Mojo.Event.listen @controller.get("MyButton"), 
      Mojo.Event.tap,
      @handleButtonPress.bind(this)

  handleButtonPress: (event) ->
    @total++
    @controller.get("count").update @total

  activate: (event) ->
    # put in event handlers  here that should only be in  effect when this scene
    # is active. For example, key handlers that are observing the document

  deactivate: (event) ->
    # remove any event  handlers you added in activate and  do any other cleanup
    # that should happen before this scene  is popped or another scene is pushed
    # on top

  cleanup: (event) ->
    # this function should do any cleanup  needed before the scene is destroyed 
    # as a result of being popped off the scene stack                           
