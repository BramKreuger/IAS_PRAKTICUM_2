extensions [table]
globals [colorlist index score stratcolor stratlist strategy stratsetsum payoff]

to setup
  clear-all
  stratset
  patchset
  reset-ticks
end

to go
  stratpopulation
  tick
end

to stratpopulation
  
end

to patchset  ; the pre-set population settings for the patches
  foreach index [ [p] -> ask n-of (count patches * (read-from-string (item p stratlist) / stratsetsum)) patches with [pcolor = black] [
     set pcolor item p colorlist 
    ]
  ]
      ask n-of (count patches * (always-defect / stratsetsum)) patches with [pcolor = black] [
     set pcolor red
    ]
    ask n-of (count patches * (play-randomly / stratsetsum)) patches with [pcolor = black] [
     set pcolor gray
    ]
    ask n-of (count patches * (unforgiving / stratsetsum)) patches with [pcolor = black] [
     set pcolor 102
    ]
    ask n-of (count patches * (tit-for-tat / stratsetsum)) patches with [pcolor = black] [
     set pcolor violet
    ]
    ask n-of (count patches * (Pavlov / stratsetsum)) patches with [pcolor = black] [
     set pcolor magenta
    ]
end



to stratset
  set stratcolor [
    ["always-cooperate" green]
    ["always-defect" red]
    ["play-randomly" gray]
    ["unforgiving" 102]
    ["tit-for-tat" violet]
    ["Pavlov" magenta]
  ]
  set stratlist map [ [x] ->  item 0 x] stratcolor
  set colorlist map [ [x] -> item 1 x] stratcolor
  set index n-values length stratlist [ [x] -> x ]
  set payoff (list (list CC-payoff-reward CD-payoff-sucker)(list DC-payoff-temptation DD-payoff-punishment))
  set stratsetsum ((always-cooperate + always-defect + play-randomly + unforgiving + tit-for-tat + Pavlov)) ; to ensure that the pre-set populations add up to 100%
  set payoff (list (list CC-payoff-reward CD-payoff-sucker) (list DC-payoff-temptation DD-payoff-punishment))
end




; voor elke strategie een percentage kiezen (wordt P1)
; volgende aandeel strategie = (Pi * Si)/(Sum(Pi * Si))
; 
