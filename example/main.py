import example

# Call the Python wrapper function
before_a, before_b = 10, 20
print(f"Before: a = {before_a}, b = {before_b}")

# Call the Python wrapper function
a, b = example.modify_values_py()
print(f"After: a = {a}, b = {b}")
