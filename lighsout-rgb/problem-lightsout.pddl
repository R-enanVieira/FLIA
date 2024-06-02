(define (problem lights-out)
  (:domain lights-out)

  (:objects 
    p1-1 p1-2 p1-3 p1-4 p2-1 p2-2 p2-3 p2-4 p3-1 p3-2 p3-3 p3-4 p4-1 p4-2 p4-3 p4-4 - position
  )

  (:init
    (same-row p1-1 p1-2) (same-row p1-1 p1-3) (same-row p1-1 p1-4)
    (same-row p1-2 p1-1) (same-row p1-2 p1-3) (same-row p1-2 p1-4)
    (same-row p1-3 p1-1) (same-row p1-3 p1-2) (same-row p1-3 p1-4)
    (same-row p1-4 p1-1) (same-row p1-4 p1-2) (same-row p1-4 p1-3) 

    (same-row p2-1 p2-2) (same-row p2-1 p2-3) (same-row p2-1 p2-4)
    (same-row p2-2 p2-1) (same-row p2-2 p2-3) (same-row p2-2 p2-4)
    (same-row p2-3 p2-1) (same-row p2-3 p2-2) (same-row p2-3 p2-4)
    (same-row p2-4 p2-1) (same-row p2-4 p2-2) (same-row p2-4 p2-3) 
    
    (same-row p3-1 p3-2) (same-row p3-1 p3-3) (same-row p3-1 p3-4)
    (same-row p3-2 p3-1) (same-row p3-2 p3-3) (same-row p3-2 p3-4)
    (same-row p3-3 p3-1) (same-row p3-3 p3-2) (same-row p3-3 p3-4)
    (same-row p3-4 p3-1) (same-row p3-4 p3-2) (same-row p3-4 p3-3)

    (same-row p4-1 p4-2) (same-row p4-1 p4-3) (same-row p4-1 p4-4)
    (same-row p4-2 p4-1) (same-row p4-2 p4-3) (same-row p4-2 p4-4)
    (same-row p4-3 p4-1) (same-row p4-3 p4-2) (same-row p4-3 p4-4)
    (same-row p4-4 p4-1) (same-row p4-4 p4-2) (same-row p4-4 p4-3) 
    

    (same-column p1-1 p2-1) (same-column p1-1 p3-1) (same-column p1-1 p4-1)
    (same-column p2-1 p1-1) (same-column p2-1 p3-1) (same-column p2-1 p4-1)
    (same-column p3-1 p1-1) (same-column p3-1 p2-1) (same-column p3-1 p4-1)
    (same-column p4-1 p1-1) (same-column p4-1 p2-1) (same-column p4-1 p3-1) 

    (same-column p1-2 p2-2) (same-column p1-2 p3-2) (same-column p1-2 p4-2)
    (same-column p2-2 p1-2) (same-column p2-2 p3-2) (same-column p2-2 p4-2)
    (same-column p3-2 p1-2) (same-column p3-2 p2-2) (same-column p3-2 p4-2)
    (same-column p4-2 p1-2) (same-column p4-2 p2-2) (same-column p4-2 p3-2) 

    (same-column p1-3 p2-3) (same-column p1-3 p3-3) (same-column p1-3 p4-3)
    (same-column p2-3 p1-3) (same-column p2-3 p3-3) (same-column p2-3 p4-3)
    (same-column p3-3 p1-3) (same-column p3-3 p2-3) (same-column p3-3 p4-3)
    (same-column p4-3 p1-3) (same-column p4-3 p2-3) (same-column p4-3 p3-3)

    (same-column p1-4 p2-4) (same-column p1-4 p3-4) (same-column p1-4 p4-4)
    (same-column p2-4 p1-4) (same-column p2-4 p3-4) (same-column p2-4 p4-4)
    (same-column p3-4 p1-4) (same-column p3-4 p2-4) (same-column p3-4 p4-4)
    (same-column p4-4 p1-4) (same-column p4-4 p2-4) (same-column p4-4 p3-4)


    (is-static p1-1)
    (is-static-hv p4-4)
    (is-static-h p2-2)
    (is-static-v p3-3)
    
    (is-off p1-1) (is-off p2-2) (is-off p2-3) (is-off p4-2) (is-off p4-3) (is-off p4-4)
    (is-red p1-2) (is-red p1-3) (is-red p2-1) (is-red p4-1)
    (is-green p3-2) (is-green p3-3) (is-green p3-4) (is-green p2-4)
    (is-blue p3-1) (is-blue p1-4) 
  )

  (:goal
    (and
    (is-off p1-1)
    (is-off p1-2)
    (is-off p1-3)
    (is-off p1-4)
    (is-off p2-1)
    (is-off p2-2)
    (is-off p2-3)
    (is-off p2-4)
    (is-off p3-1)
    (is-off p3-2)
    (is-off p3-3)
    (is-off p3-4)
    (is-off p4-1)
    (is-off p4-2)
    (is-off p4-3)
    (is-off p4-4))
  )
)
