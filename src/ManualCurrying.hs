module ManualCurrying (manualCurry) where
  
manualCurry :: ((c, c) -> c) -> (c -> c -> c)
manualCurry uncurriedFunction first second = uncurriedFunction (first, second)


