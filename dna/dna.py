from sys import argv, exit
import csv


def get_max_time_of_repetition(string, substring):
    ans = [0] * len(string)
    for i in range(len(string) - len(substring), -1, -1):
        if string[i: i + len(substring)] == substring:
            if i + len(substring) > len(string) - 1:
                ans[i] = 1
            else:
                ans[i] = 1 + ans[i + len(substring)]
    return max(ans)
    
    
def print_match(reader, final_array):
    for line in reader:
        name = line[0]
        values = [int(val) for val in line[1:]]
        if values == final_array:
            print(name)
            return
    print("No match")
        
        
def main():
    if len(argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        exit(1)
        
    database = argv[1]
    with open(database) as db_file:
        reader = csv.reader(db_file)
        all_sequences = next(reader)[1:]
 
        sequences = argv[2]
        with open(sequences) as sequence_file:
            sequence = sequence_file.read()
            final_array = [get_max_time_of_repetition(sequence, substring) for substring in all_sequences]
      
        print_match(reader, final_array)
                

if __name__ == "__main__":
    main()