def divide_numbers(a, b):
    return a / b

def main():
    num1 = 10
    num2 = 0  # This will cause a division by zero error
    result = divide_numbers(num1, num2)
    print(f"The result is {result}")

if __name__ == "__main__":
    main()