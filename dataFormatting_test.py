import codecs
import sys


def character_split(input_file, output_file):
    input_data = codecs.open(input_file, 'r', 'utf-8')
    output_data = codecs.open(output_file, 'w', 'utf-8')
    for line in input_data.readlines():
        for word in line.strip():
            word = word.strip()
            if word:
                output_data.write(word + "\tB\n")
    input_data.close()
    output_data.close()


print(sys.argv[1])
print(sys.argv[2])
character_split(sys.argv[1], sys.argv[2])
