(define (problem lightsout)
  (:domain lights-out)

  (:objects 
    x1 x2 x3 x4 y1 y2 y3 y4 - position
  )

  (:init
    (same-row x1 y1) (same-row x1 y2) (same-row x1 y3) (same-row x1 y4)
    (same-row x2 y1) (same-row x2 y2) (same-row x2 y3) (same-row x2 y4)
    (same-row x3 y1) (same-row x3 y2) (same-row x3 y3) (same-row x3 y4)
    (same-row x4 y1) (same-row x4 y2) (same-row x4 y3) (same-row x4 y4)
    
    (same-column x1 y1) (same-column x2 y1) (same-column x3 y1) (same-column x4 y1)
    (same-column x1 y2) (same-column x2 y2) (same-column x3 y2) (same-column x4 y2)
    (same-column x1 y3) (same-column x2 y3) (same-column x3 y3) (same-column x4 y3)
    (same-column x1 y4) (same-column x2 y4) (same-column x3 y4) (same-column x4 y4)

    (is-static x1 y1)
    (is-static-hv x4 y4)
    (is-static-h x2 y2)
    (is-static-v x3 y3)
    
    (is-off x1 y1) (is-off x2 y2) (is-off x2 y3) (is-off x4 y2) (is-off x4 y3) (is-off x4 y4)
    (is-red x1 y2) (is-red x1 y3) (is-red x2 y1) (is-red x4 y4)
    (is-green x3 y2) (is-green x3 y3) (is-green x3 y4)
    (is-blue x3 y1) (is-blue x1 y4) 
  )

  (:goal
    (forall 
      (?v - position)
      (forall 
          (?w - position)
          (is-off ?v ?w)
      )
    )
  )
)
