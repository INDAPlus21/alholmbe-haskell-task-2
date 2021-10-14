sum' :: (Integral n, Num n) => n -> n -> n
sum' s 0 = s
sum' s n = sum' (s + n) (pred n)

naiveFib :: Integer -> Integer
naiveFib 0 = 0
naiveFib 1 = 1
naiveFib n = naiveFib (n - 1) + naiveFib (n - 2)