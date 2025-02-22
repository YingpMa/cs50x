while True:
    number = input("Number: ")
    digits = len(number)
    try:
        number = int(number)
        break
    except ValueError:
        pass

if digits not in [13, 15, 16]:
    print("INVALID")
else:
    total = 0
    number = str(number)
    if digits % 2 == 0:
        for i in range(0, digits, 2):
            total += int(number[i]) * 2 // 10 + int(number[i]) * 2 % 10
        for i in range(1, digits, 2):
            total += int(number[i])
    else:
        for i in range(0, digits, 2):
            total += int(number[i])
        for i in range(1, digits, 2):
            total += int(number[i]) * 2 // 10 + int(number[i]) * 2 % 10
    if total % 10 == 0:
        if number[:2] in ['34', '37'] and digits == 15:
            print("AMEX")
        elif number[:2] in ['51', '52', '53', '54', '55'] and digits == 16:
            print("MASTERCARD")
        elif number[0] == '4' and (digits == 13 or digits == 16):
            print("VISA")
        else:
            print("INVALID")
    else:
        print("INVALID")
