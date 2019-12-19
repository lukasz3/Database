IF 500 > ALL (SELECT Amount FROM [TrainingDb].[usr].[Products])
  PRINT 'jest wieksze od wszystkich'
  
  IF 500 > SOME (SELECT Amount FROM [TrainingDb].[usr].[Products])
  PRINT 'jest wieksze od ktoregos'