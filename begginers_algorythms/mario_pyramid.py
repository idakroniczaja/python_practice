from cs50 import get_int


def main():
    height = get_positive_int()
    for i in range(height):
        for j in range(height):
            if j < height - (i + 1):
                print(" ", end="")
            else:
                print("#", end="")
            
        print()
    
    
def get_positive_int():
    while True:
        n = get_int("Height: ")
        if n > 0 and n < 9:
            break
    return n


main()