a = [75, 25, 10, 5, 4, 2]
t = 125

length = a.length
found = 7
used_bits = 1

simpop = (a, b, rest) ->
  if rest
    if a % b
      Math.min simpop(a + b, rest[0], rest.slice 1),
               simpop(a - b, rest[0], rest.slice 1),
               simpop(a * b, rest[0], rest.slice 1),
               simpop(a / b, rest[0], rest.slice 1)
    else
      Math.min simpop(a + b, rest[0], rest.slice 1),
               simpop(a - b, rest[0], rest.slice 1),
               simpop(a * b, rest[0], rest.slice 1)
  if a % b
    Math.min a + b, a - b, a * b, a / b
  else
    Math.min a + b, a - b, a * b

while ++used_bits < (2 << length)
  b = []
  for i in [0...length]
    if used_bits & (1 << i)
      b.push a[i]
  if b.length >= 2
    c = simpop b.unshift(), b.unshift(), b
    if c < found then found = c

if found is 7
  found = 0

return found