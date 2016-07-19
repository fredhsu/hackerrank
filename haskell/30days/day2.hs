main = do
 meal <- getLine
 tip <- getLine
 tax <- getLine
 let mealcost = read meal
 let tipcost = mealcost * (read tip) / 100
 let taxcost = mealcost * (read tax) / 100
 let total = round (mealcost + taxcost + tipcost)
 putStrLn $ "The total meal cost is " ++ show total ++ " dollars."
