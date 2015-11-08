#n = (int > 0)
seq = []
n = int(input('Enter a positive integer: '))

def hs(n):
    while n != 1:
        if n % 2 == 0:
            n = n//2
            seq.append(n)
        else:
            n = 3*n+1
            seq.append(n)
    return None

seq.append(n)
hs(n)

print(seq)
print(len(seq))
