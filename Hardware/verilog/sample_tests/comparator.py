def write_to(file):
    f = open(file, 'w')
    f.close()


def check(f1, f2):
    with open(f1, 'r') as file1, open(f2, 'r') as file2:
        # Read the contents of both files
        file1_contents = file1.read()
        file2_contents = file2.read()

        # Compare the contents of the files
        if file1_contents == file2_contents:
            print("The files are identical.")
        else:
            print("The files are different.")


f1 = '_mux.txt'
f2 = '8mux_result.txt'

#write_to(f2)
check(f1, f2)





