from cs50 import get_float, get_int, get_string


def main():
    change = get_positive_float()
    
    # converting dolars to cents
    cents = round(change * 100)
    
    # start looping through and subtract coins with adding 1 everytime the condition is met
    quarters = 0
    while cents >= 25:
        cents -= 25
        quarters += 1
    
    dimes = 0
    while cents < 25 and cents >= 10:
        cents -= 10
        dimes += 1
    
    nickles = 0
    while cents < 10 and cents >= 5:
        cents -= 5
        nickles += 1
        
    pennies = 0
    while cents < 5 and cents > 0:
        cents -= 1
        pennies += 1
        
    sum = quarters + dimes + nickles + pennies + cents
        
    print(sum)
    
    
    
def get_positive_float():
    while True:
        n = get_float("Change owed: ")
        if n > 0:
            break
    return n


main()