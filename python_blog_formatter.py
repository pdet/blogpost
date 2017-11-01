
import re

code = """
import cPickle 
 
 
def mean_deviation(column): 
        mean = 0.0
        for i in range (0, len(column)):
            mean += column[i]
        mean = mean / len(column)
        distance = 0.0
        for i in range (0, len(column)):
            distance += column[i] - mean
        deviation = distance/len(column)
        return deviation;

input_parameters = cPickle.load(open('./input_data.bin','rb'))
mean_deviation(input_parameters['column'])
"""

sql_codewords = []
python_codewords = ["print", "import", "for", "in", "if", "del"]
string_regex = re.compile("('[^']+')")
comment_regex = re.compile("(#[^\n]+)")

sql_codestyle = 'color:blue;font-weight:bold;'
python_codestyle = 'color:blue;font-weight:bold;'
string_codestyle = 'color:firebrick;'
comment_codestyle = 'color:green;'


def char_is_valid(char):
    return char.isspace() or char == '(' or char == ')' or char == ':' or char ==';' or char=='\'' or char == '"' or char =='\n' or char ==',' or char =='.'

def style_code(codewords, codestyle):
    global code
    for codeword in codewords:
        startpos = 0
        while True:
            pos = code[startpos:].lower().find(codeword)
            if pos >= 0:
                pos = pos + startpos
                if (pos == 0 or char_is_valid(code[pos - 1])) and char_is_valid(code[pos + len(codeword)]):
                    styled_string = "<span style=\"%s\">" % codestyle + code[pos:pos + len(codeword)] + "</span>"
                    code = code[:pos] + styled_string + code[pos + len(codeword):]
                    startpos = pos + len(styled_string) + len(codeword)
                else:
                    startpos = pos + len(codeword)
            else:
                break

def style_code_regex(regex, codestyle):
    global code
    span_regex = re.compile('(<[^>]+>)')
    startpos = 0
    while True:
        match = regex.search(code[startpos:])
        if match == None:
            break
        ele = match.groups()[0]
        ele = re.sub(span_regex, "", ele)

        styled_string = "<span style=\"%s\">" % codestyle + ele + "</span>"
        code = code[:startpos + match.start()] + styled_string + code[startpos + match.end():]
        startpos = startpos + match.start() + len(styled_string)


style_code_regex(string_regex, string_codestyle)
style_code(sql_codewords, sql_codestyle)
style_code(python_codewords, python_codestyle)
style_code_regex(comment_regex, comment_codestyle)

code = '<pre style="font:courier-new;background-color:rgb(234,234,234);padding:10px;padding-left:20px">' + code + '</pre>'

print(code)