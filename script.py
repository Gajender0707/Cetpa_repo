print("this is the demo file")
#6. Find all prime numbers up to N
n=20
for i in range(1,n+1):
    k=0
    for j in range(2,i):
        if i%j==0:
            k=k+1
    if k==0:
        print(f" {i} is Prime")
    else:
        print(f"{i} is  not Prime")