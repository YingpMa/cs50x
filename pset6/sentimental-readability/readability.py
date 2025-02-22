import string


def count_letters(text: str):
    letters = 0
    for character in text:
        if character in string.ascii_letters:
            letters += 1
    return letters


def count_words(text: str):
    words = 1
    for item in text:
        if item == " ":
            words += 1
    return words


def count_sentences(text: str):
    sentences = 0
    for item in text:
        if item in ['.', '?', '!']:
            sentences += 1
    return sentences


text = input("Text: ")

letters = count_letters(text)
words = count_words(text)
sentences = count_sentences(text)

index = 0.0588 * letters * 100 / words - 0.296 * sentences / words * 100 - 15.8
index = round(index)

if index >= 16:
    print("Grade 16+")
elif index < 1:
    print("Before Grade 1")
else:
    print(f"Grade {index}")
