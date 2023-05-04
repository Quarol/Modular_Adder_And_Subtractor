f1 = '_first.txt'
f2 = 'first_stage_results.txt'

with open(f1, 'r') as file1, open(f2, 'r') as file2:
    # Read the contents of both files
    file1_contents = file1.read()
    file2_contents = file2.read()

    # Compare the contents of the files
    if file1_contents == file2_contents:
        print("The files are identical.")
    else:
        print("The files are different.")
