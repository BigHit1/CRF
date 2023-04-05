import codecs
import sys


def character_tagging(input_file, output_file):
    input_data = codecs.open(input_file, 'r', 'utf-8')
    output_data = codecs.open(output_file, 'w', 'utf-8')
    for line in input_data.readlines():
        word_list = line.strip().split()
        for word in word_list:
            if len(word) == 1:
                output_data.write(word + "\tS\n")
            else:
                output_data.write(word[0] + "\tB\n")
                for w in word[1:len(word) - 1]:
                    output_data.write(w + "\tM\n")
                output_data.write(word[len(word) - 1] + "\tE\n")
        output_data.write("\n")
    input_data.close()
    output_data.close()


#character_tagging("./Data/icwb2-data/training/as_training.utf8", "./Data/icwb2-data/formated_training/formated_as.utf8")
#character_tagging("./Data/icwb2-data/training/cityu_training.utf8", "./Data/icwb2-data/formated_training/formated_cityu.utf8")
#character_tagging("./Data/icwb2-data/training/msr_training.utf8", "./Data/icwb2-data/formated_training/formated_msr.utf8")
#character_tagging("./Data/icwb2-data/training/pku_training.utf8", "./Data/icwb2-data/formated_training/formated_pku.utf8")
print(sys.argv[1])
print(sys.argv[2])
character_tagging(sys.argv[1],sys.argv[2])
