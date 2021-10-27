from cs50 import get_float, get_int, get_string


def main():
    # Get input words from both players
    text = get_string("Text: ")

    no_of_sentences = count_sentences(text)
    no_of_words = count_words(text)
    no_of_letters = count_letters(text)

    # Get Coleman-Liau index
    L = (no_of_letters * 100) / no_of_words
    S = (no_of_sentences * 100) / no_of_words

    index = 0.0588 * L - 0.296 * S - 15.8

    # Rounding to the nearest integer
    grade = round(index)
    # Print grades depending on value of index
    
    if grade >= 16:
        print("Grade 16+")
    elif grade < 1:
        print("Before Grade 1")
    else:
        print(f"Grade {grade}")
    

def count_sentences(text):
    sentences = 0
    for character in text:
        if character == '.' or character == '?' or character == '!':
            sentences += 1
        else:
            sentences += 0

    return sentences
    

def count_words(text):
    words = 1
    for character in text:
        if character == ' ':
            words += 1
        else:
            words += 0

    return words
    

def count_letters(text):
    letters = 0
    for character in text:
        if (character >= 'A' and character <= 'Z') or (character >= 'a' and character <= 'z'):
            letters += 1
        else:
            letters += 0

    return letters
    

main()