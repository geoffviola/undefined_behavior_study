#!/usr/bin/env python3
# coding=utf-8

import argparse
import os
import urllib.request


def parse_args():
    parser = argparse.ArgumentParser(description='download and place files.')
    parser.add_argument('--output_static_analysis_debug', type=str,
                        default="debug/warnings_table.txt")
    parser.add_argument('--output_static_analysis_relwithdebinfo', type=str,
                        default="rel_with_deb_info/warnings_table.txt")
    parser.add_argument('--output_runtime_debug', type=str,
                        default="debug/results.txt")
    parser.add_argument('--output_runtime_relwithdebinfo', type=str,
                        default="rel_with_deb_info/results.txt")
    parser.add_argument('--text_url', type=str,
                        default="https://ci.appveyor.com/api/buildjobs/nr19fl0gqs55ulog/log",
                        help='msvc text file')
    return parser.parse_args()


def check_close_file(file_writing, file_being_written, no_timestamp):
    if no_timestamp == b"MSVC Debug Compiler Warnings End\r\n":
        file_writing = False
        file_being_written.close()
    if no_timestamp == b"MSVC RelWithDebInfo Compiler Warnings End\r\n":
        file_writing = False
        file_being_written.close()
    if no_timestamp == b"MSVC Debug Crashes End\r\n":
        file_writing = False
        file_being_written.close()
    if no_timestamp == b"MSVC RelWithDebInfo Crashes End\r\n":
        file_writing = False
        file_being_written.close()
    return (file_writing, file_being_written)


def check_file_open(file_writing, file_being_written, no_timestamp, args):
    if no_timestamp == b"MSVC Debug Compiler Warnings Start\r\n":
        file_writing = True
        mkdir(args.output_static_analysis_debug)
        file_being_written = open(args.output_static_analysis_debug, 'w')
    if no_timestamp == b"MSVC RelWithDebInfo Compiler Warnings Start\r\n":
        file_writing = True
        mkdir(args.output_static_analysis_relwithdebinfo)
        file_being_written = open(
            args.output_static_analysis_relwithdebinfo, 'w')
    if no_timestamp == b"MSVC Debug Crashes Start\r\n":
        file_writing = True
        mkdir(args.output_runtime_debug)
        file_being_written = open(args.output_runtime_debug, 'w')
    if no_timestamp == b"MSVC RelWithDebInfo Crashes Start\r\n":
        file_writing = True
        mkdir(args.output_runtime_relwithdebinfo)
        file_being_written = open(args.output_runtime_relwithdebinfo, 'w')

    return (file_writing, file_being_written)


def write_file(file_writing, file_being_written, no_timestamp, args):
    file_writing, file_being_written = check_close_file(
        file_writing, file_being_written, no_timestamp)
    if file_writing:
        file_being_written.write(no_timestamp.decode("utf-8"))
    file_writing, file_being_written = check_file_open(
        file_writing, file_being_written, no_timestamp, args)
    return (file_writing, file_being_written)


def mkdir(filepath):
    os.makedirs(os.path.dirname(filepath), exist_ok=True)


if __name__ == "__main__":
    args = parse_args()
    file_writing = False
    static_analysis_debug = 0
    static_analysis_relwithdebinfo = 0
    runtime_debug = 0
    runtime_relwithdebinfo = 0
    file_being_written = 0
    with urllib.request.urlopen(args.text_url) as msvc_text:
        for l in msvc_text:
            if len(l) < 11:
                print("file should have a timestamp like \"[00:01:35] \"")
                exit(1)
            no_timestamp = l[11:]
            file_writing, file_being_written = write_file(
                file_writing, file_being_written, no_timestamp, args)
