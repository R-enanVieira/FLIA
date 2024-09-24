(define (domain pacman)
  (:requirements :strips :action-costs :durative-actions)
  (:types position count)

  (:predicates
    (inc ?a ?b - position)
    (dec ?a ?b - position)

    (wall ?x ?y - position)
    (has-dots ?x ?y - position)
    
    (pacman-at ?x ?y - position)
    (pacman-turn)

    (has-enemy)

    (has-red-ghost)
    (red-ghost-at ?x ?y - position)
    (red-ghost-turn)

    (has-green-ghost)
    (green-ghost-at ?x ?y - position)
    (green-ghost-turn)

    (has-blue-ghost)
    (blue-ghost-at ?x ?y - position)
    (blue-ghost-turn)

    (red-fruit-at ?x ?y - position)
    (green-fruit-at ?x ?y - position)
    (blue-fruit-at ?x ?y - position)
    
    (check-death)
    (win)
  )

  (:functions

  )

  ;actions
  (:action pacman-move-up
    :parameters (?x ?y ?yn- position)
  )

  (:action pacman-move-down
    :parameters (?x ?y ?yn- position)
    
  )

  (:action pacman-move-left
    :parameters (?x ?y ?yn- position)
    
  )

  (:action pacman-move-right
    :parameters (?x ?y ?yn- position)
    
  )
  
  (:action redGhost-move
    :parameters (?x ?y ?yn- position)
    
  )
  
  (:action greenGhost-move
    :parameters (?x ?y ?yn- position)
    
  )

  (:action blueGhost-move
    :parameters (?x ?y ?yn- position)
    
  )
)
