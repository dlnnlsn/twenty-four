#!/usr/bin/env python3

from fractions import Fraction

class Add:
    valid = lambda x, y: x <= y
    apply = lambda x, y: x + y

class Sub:
    valid = lambda x, y: True
    apply = lambda x, y: x - y

class Mul:
    valid = lambda x, y: x <= y
    apply = lambda x, y: x * y

class Div:
    valid = lambda x, y: y != 0
    apply = lambda x, y: x / y

operations = [Add, Sub, Mul, Div]

def step(nums):
    for i, x in enumerate(nums):
        for j, y in enumerate(nums):
            if i == j: continue
            for op in operations:
                if not op.valid(x, y): continue
                new_nums = nums[:]
                new_nums.pop(i)
                new_nums.pop(j if j < i else j - 1)
                new_nums.append(op.apply(x, y))
                yield new_nums

def results(nums):
    if len(nums) <= 1: return set(nums)
    res = set()
    for s in step(nums):
        res.update(results(s))
    return res

for x in range(1, 10):
    for y in range(x, 10):
        for z in range(y, 10):
            for w in range(z, 10):
                nums = [x, y, z, w]
                if not 24 in results(list(map(Fraction, nums))):
                    print(", ".join(map(str, nums)))
