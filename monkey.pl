state(atdoor,onfloor,atwindow,hasnot).
state(atwindow,onfloor,atwindow,hasnot).
state(middle,onbox,middle,hasnot).
state(middle,onbox,middle,has).

move(state(atdoor,onfloor,atwindow,hasnot),
     walk,
     state(atwindow,onfloor,atwindow,hasnot)).

move(state(atwindow,onfloor,atwindow,hasnot),
     pushbox,
     state(middle,onfloor,middle,hasnot)).

move(state(middle,onfloor,middle,hasnot),
     climb,
     state(middle,onbox,middle,hasnot)).

move(state(middle,onbox,middle,hasnot),
     grasp,
     state(middle,onbox,middle,has)).