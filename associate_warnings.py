#!/usr/bin/env python3
# coding=utf-8

import argparse
import os


def parse_args():
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--cpp_dir')
    parser.add_argument('--out_file', type=argparse.FileType('w'),
                        default="warnings_table.txt")
    parser.add_argument('--warnings_file', type=argparse.FileType('r'),
                        default="warnings.txt",
                        help='warnings files to read')
    return parser.parse_args()


def get_cpp_files(path, extension):
    output = []
    for (dirpath, dirnames, filenames) in os.walk(path):
        for filename in filenames:
            if len(filename) > len(extension) and \
                    extension in filename and filename not in output:
                output.append(dirpath + "/" + filename)
    return output


def parse_warnings(file_handle, test_names):
    warnings_dict = {}
    for test_name in test_names:
        warnings_dict[test_name] = ""
    for l in file_handle:
        for test_name in test_names:
            if test_name in l.replace("\\", "/"):
                warning = ""
                msvc_trigger = ": warning C"
                msvc_triggered = False
                if msvc_trigger in l:
                    warning = l[l.find(msvc_trigger) +
                                len(msvc_trigger):].split()[0][:-1]
                    msvc_triggered = True
                start_bracket = l.rfind("[")
                end_bracket = l.rfind("]")
                # clang, cppcheck, gcc
                if start_bracket > 0 and end_bracket > -1 and start_bracket < end_bracket and not msvc_triggered:
                    warning = l[start_bracket+1:end_bracket]
                if len(warning) > 0:
                    if warning in warnings_dict[test_name]:
                        break
                    if warnings_dict[test_name] == "1":
                        warnings_dict[test_name] = ""
                    elif "" != warnings_dict[test_name]:
                        warnings_dict[test_name] += ","
                    warnings_dict[test_name] += warning
                    break
                elif warnings_dict[test_name] == "" and ("warning" in l.lower() or "error" in l.lower()) and not "/errorReport" in l:
                    warnings_dict[test_name] = "1"
    return warnings_dict


def write_file(warnings_dict, out_file):
    for key, value in warnings_dict.items():
        short_name = key[key.rfind("/")+1:key.rfind(".")]
        out_file.write(short_name + " " + value + "\n")


if __name__ == "__main__":
    args = parse_args()
    extension = ".cpp"
    test_names = get_cpp_files(args.cpp_dir, extension)
    warnings_dict = parse_warnings(args.warnings_file, test_names)
    write_file(warnings_dict, args.out_file)
