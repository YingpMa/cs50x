
while True:
    height = input("Height: ")
    try:
        height = int(height)
        if height >= 1 and height <= 8:
            break
    except ValueError:
        pass

for i in range(1, height + 1):
    print(" " * (height - i) + "#" * i + "  " + "#" * i)
