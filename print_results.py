#!/usr/bin/env python3
# coding=utf-8

import csv
import os
from collections import defaultdict
from enum import IntEnum

cool_x = "❌"
cool_check = "✔️"

ignore_targets = [
    'no_undefined_behavior',
    'reading_uninitialized_value_lib']


class DetectionType(IntEnum):
    COMPILER_WARNING = 1
    STANDALONE_STATIC_ANALYSIS = 2
    RUNTIME_CRASH = 3
    EXTRA_DYNAMIC_ANALYSIS = 4


def print_debug_release_legend():
    print("Debug (unoptimized) / RelWithDebInfo (optimized)\n")


def read_static_analysis():
    results = {}

    for root, subdirs, files in os.walk('.'):
        for f in files:
            if f.find("warnings_table.txt") != -1:
                filename = root + "/" + f
                results[filename] = csv.reader(
                    open(root + "/" + f), delimiter=' ')

    return results


def process_static_analysis_results(results):
    output_table = defaultdict(lambda: defaultdict(lambda: defaultdict(str)))

    for filename, csv in results.items():
        tool = ""
        if "clang" in filename:
            if "tidy" in filename:
                tool = "clang-tidy"
            elif "/clang/":
                tool = "clang"
            else:
                # skip dynamic analysis warnings
                continue
        elif "gcc" in filename:
            tool = "gcc"
        elif "cppcheck" in filename:
            tool = "cppcheck"
        elif "msvc" in filename:
            tool = "msvc"
        else:
            print("couldn't find tool for", filename)
            exit(1)

        debug_mode = -1
        if "debug" in filename:
            debug_mode = 1
        if "rel_with_deb_info" in filename:
            debug_mode = 0

        for row in csv:
            if row[0] in ignore_targets:
                # Allow cppcheck to be correct one file over
                if ("cppcheck" in filename and
                        row[0] == "reading_uninitialized_value_lib" and
                        row[1] == "ctuuninitvar"):
                    continue
                # Consider warnings in known good files an internal error
                if len(row) > 0 and row[1] != "":
                    print("static analysis is broken in", filename, row)
                    exit(1)
                continue
            if len(row) == 2:
                result = row[1]
            elif len(row) > 2:
                print("unknown data:", filename, row)
                exit(1)
            else:
                result = ""
            test_name = row[0].replace("_", " ")
            # Clang warnings are different with dynamic analysis
            if len(output_table[tool][test_name][debug_mode]) == 0 or (
                    output_table[tool][test_name][debug_mode] == "1" and len(result) > 0):
                output_table[tool][test_name][debug_mode] = result

    return output_table


def print_compiler_warnings(output_table):
    print("### 1.1.Compiler Warnings")
    print("Compiler | Undefined Behavior Type | Warning | Warning Opt | Name")
    print("--- | --- | --- | --- | ---")
    for compiler, rest_0 in sorted(output_table.items()):
        for test, rest_1 in sorted(rest_0.items()):
            rest_1_dict = dict(rest_1)
            if -1 in rest_1_dict:
                continue
            if 0 not in rest_1_dict:
                print('error 0 not in rest_1_dict', rest_1_dict)
            warning_opt = cool_check if len(rest_1_dict[0]) > 0 else cool_x
            if 1 not in rest_1_dict:
                print('error 1 not in rest_1_dict', rest_1_dict)
            warning_unopt = cool_check if len(rest_1_dict[1]) > 0 else cool_x
            warning_name = ""
            if len(rest_1_dict[0]) > 0:
                warning_name = rest_1_dict[0]
            elif len(rest_1_dict[1]) > 0:
                warning_name = rest_1_dict[1]
            else:
                warning_name = "n/a"
            print(compiler, "|", test, "|", warning_unopt,
                  "|", warning_opt, "|", warning_name)


def print_tool_static_analysis(output_table):
    print("### 1.2.Static Analyzers")
    print("Tool | Undefined Behavior Type | Warning | Name")
    print("--- | --- | --- | ---")
    for tool, rest_0 in sorted(output_table.items()):
        for test, rest_1 in sorted(rest_0.items()):
            if -1 not in dict(rest_1):
                continue
            warning = rest_1[-1]
            result = cool_check if len(warning) > 0 else cool_x
            warning_name = ""
            if len(warning) > 0 and warning != "1":
                warning_name = warning
            else:
                warning_name = "n/a"
            print(tool, "|", test, "|", result, "|", warning_name)


def print_static_analysis_summary(output_table):
    print("### 1.3.Static Analysis Summary")
    print_debug_release_legend()
    summary_table = defaultdict(
        lambda: defaultdict(
            lambda: defaultdict(
                lambda: defaultdict(bool))))
    tool_line = "Undefined Behavior Type"
    tool_table_line = "---"
    tools = []
    for tool, rest_0 in sorted(output_table.items()):
        tools.append(tool)
        tool_line += " | " + tool
        tool_table_line += " | ---"
        for test, rest_1 in sorted(rest_0.items()):
            warning_result = -1
            for optimization, warning in sorted(rest_1.items()):
                summary_table[test][tool][optimization] = len(warning) > 0

    print(tool_line)
    print(tool_table_line)

    for test, rest_0 in sorted(summary_table.items()):
        output_line = test
        tool_index = 0
        for tool, rest_1 in sorted(rest_0.items()):
            while tool != tools[tool_index]:
                tool_index += 1
                output_line += " | n/a"
            tool_index += 1
            output_line += " | "
            if -1 in rest_1:
                output_line += detection_to_str(rest_1[-1])
            else:
                assert(0 in rest_1)
                assert(1 in rest_1)
                output_line += detections_to_str(rest_1[1], rest_1[0])
        while tool_index < len(tools):
            tool_index += 1
            output_line += " | n/a"
        print(output_line)


def read_runtime_results():
    results = {}

    for root, subdirs, files in os.walk('.'):
        for f in files:
            if f.find("results.txt") != -1:
                filename = root + "/" + f
                results[filename] = csv.reader(
                    open(root + "/" + f), delimiter=' ')

    return results


def process_runtime_results(runtime_results):
    output_table = defaultdict(lambda: defaultdict(
        lambda: defaultdict(lambda: defaultdict(str))))

    for filename, csv in runtime_results.items():
        if "valgrind" in filename:
            analyzer = "valgrind"
        elif "sanitize" in filename:
            analyzer = ""
            known_analyzers = ['address', 'leak', 'memory', 'undefined']
            for known_analyzer in known_analyzers:
                if known_analyzer in filename:
                    if len(analyzer) > 0:
                        analyzer += ','
                    analyzer += known_analyzer
        else:
            analyzer = ""
        if "gcc" in filename:
            compiler = "gcc"
        elif "msvc" in filename:
            compiler = "msvc"
        else:
            compiler = "clang"
        if filename.find("debug") != -1:
            debug_mode = 1
        else:
            debug_mode = 0
        for row in csv:
            if row[0] in ignore_targets:
                if row[1] != "0":
                    print(filename, "broken")
                    exit(1)
                continue
            output_table[compiler][analyzer][row[0].replace(
                "_", " ")][str(debug_mode)] = int(row[1])
    return output_table


def detection_to_str(detection):
    if detection:
        return cool_check
    else:
        return cool_x


def detections_to_str(d, r):
    if d and r:
        return cool_check
    elif not d and not r:
        return cool_x
    else:
        left = detection_to_str(d)
        right = detection_to_str(r)
        return left + '/' + right


def return_codes_to_str(return_code_d, return_code_r):
    return detections_to_str(return_code_d != 0, return_code_r != 0)


def print_runtime_crashes(output_table):
    print("## 2.Runtime Crashes")
    print("### 2.1.Runtime Crashes Return Codes")
    print("Compiler | Undefined Behavior Type | Debug | RelWithDebInfo")
    print("--- | --- | --- | ---")
    no_tool_test_table = defaultdict(
        lambda: defaultdict(lambda: defaultdict(str)))
    compilers = []
    for compiler, rest_0 in sorted(output_table.items()):
        for tool, rest_1 in sorted(rest_0.items()):
            if tool != "":
                continue
            compilers.append(compiler)
            for test, rest_2 in sorted(rest_1.items()):
                no_tool_test_table[test][compiler]["1"] = rest_2["1"]
                no_tool_test_table[test][compiler]["0"] = rest_2["0"]
                print(compiler + " | " + test + " | " +
                      str(rest_2["1"]) + " | " + str(rest_2["0"]))

    print("")
    print("### 2.2.Runtime Crashes Summary")
    print_debug_release_legend()
    tool_print_line = "Undefined Behavior"
    tool_delim_print_line = "---"
    tool_print_line_r = ""
    for compiler in compilers:
        tool_print_line += " | " + compiler
        tool_delim_print_line += " | ---"
    print(tool_print_line)
    print(tool_delim_print_line)
    for test, rest_0 in sorted(no_tool_test_table.items()):
        line = test
        line_r = ""
        compiler_index = 0
        for compiler, rest_1 in sorted(rest_0.items()):
            while compiler != compilers[compiler_index]:
                compiler_index += 1
                line += " | n/a"
                line_r += " | n/a"
            compiler_index += 1
            line += ' | '
            line += return_codes_to_str(rest_1["1"], rest_1["0"])
        while compiler_index < len(compilers):
            compiler_index += 1
            line += " | n/a"
        print(line)


def print_dynamic_analysis(output_table):
    print("## 3.Extra Dynamic Analysis")
    print("### 3.1.Extra Dynamic Analysis Return Codes")
    print("Compiler | Tool | Undefined Behavior Type | Debug | RelWithDebInfo")
    print("--- | --- | --- | --- | ---")
    tool_test_table = defaultdict(lambda: defaultdict(
        lambda: defaultdict(lambda: defaultdict(lambda: defaultdict(str)))))
    clang_tools = []
    gcc_tools = []
    for compiler, rest_0 in sorted(output_table.items()):
        for tool, rest_1 in sorted(rest_0.items()):
            if tool != "":
                if compiler == "clang":
                    clang_tools.append(tool)
                else:
                    gcc_tools.append(tool)
                for test, rest_2 in sorted(rest_1.items()):
                    tool_test_table[test][compiler][tool]["1"] = rest_2["1"]
                    tool_test_table[test][compiler][tool]["0"] = rest_2["0"]
                    print(compiler + " | " + tool + " | " + test + " | " +
                          str(rest_2["1"]) + " | " + str(rest_2["0"]))

    def print_extra_dynamic_analysis_by_compiler(
            target_compiler, header_str, tools):
        print("")
        maybe_valgrind = ""
        print(
            "### " +
            header_str +
            "Extra Dynamic Analysis Summary " +
            target_compiler.capitalize())
        print_debug_release_legend()
        dynamic_analysis_summary_row = "--- |" * len(tools) + " ---"
        print("Undefined Behavior Type" +
              ''.join([' | ' + str(x) for x in tools]))
        print(dynamic_analysis_summary_row)
        for test, rest_0 in sorted(tool_test_table.items()):
            line = test
            for tool in tools:
                line += " | "
                if target_compiler in rest_0 and tool in rest_0[target_compiler]:
                    line += return_codes_to_str(
                        rest_0[target_compiler][tool]["1"],
                        rest_0[target_compiler][tool]["0"])
                else:
                    line += "n/a"
            print(line)

    print_extra_dynamic_analysis_by_compiler("clang", "3.2.1.", clang_tools)
    print_extra_dynamic_analysis_by_compiler("gcc", "3.2.2.", gcc_tools)


def print_runtime_results():
    runtime_results = read_runtime_results()
    output_table = process_runtime_results(runtime_results)
    print_runtime_crashes(output_table)
    print("")
    print("")
    print_dynamic_analysis(output_table)
    return output_table


def print_static_analysis_results():
    static_analysis_results = read_static_analysis()
    output_table = process_static_analysis_results(static_analysis_results)
    print("## 1.Static Analysis")
    print_compiler_warnings(output_table)
    print("")
    print_tool_static_analysis(output_table)
    print("")
    print_static_analysis_summary(output_table)
    return output_table


def print_overall_results(static_analysis, runtime_analysis):
    print("### 4.Overall Summary")
    print("Undefined Behavior Type | Compiler Warning | Standalone Static Analysis | Runtime Crash | Extra Dynamic Analsyis")
    print("--- | --- | --- | --- | ---")
    table = defaultdict(lambda: defaultdict(bool))

    for tool, rest_0 in static_analysis.items():
        for test, rest_1 in rest_0.items():
            for optimization, result in rest_1.items():
                if tool == "clang" or tool == "gcc" or tool == "msvc":
                    detection_type = DetectionType.COMPILER_WARNING
                else:
                    detection_type = DetectionType.STANDALONE_STATIC_ANALYSIS
                table[test][detection_type] = table[test][detection_type] or len(
                    result) > 0

    for compiler, rest_0 in dynamic_analysis.items():
        for tool, rest_1 in rest_0.items():
            for test, rest_2 in rest_1.items():
                for optimization, result in rest_2.items():
                    if len(tool) == 0:
                        detection_type = DetectionType.RUNTIME_CRASH
                    else:
                        detection_type = DetectionType.EXTRA_DYNAMIC_ANALYSIS
                    table[test][detection_type] = 0 != result or table[test][detection_type]

    for test, rest_0 in sorted(table.items()):
        line = test
        for detection_type in DetectionType:
            line += ' | '
            if detection_type in rest_0:
                line += detection_to_str(rest_0[detection_type])
            else:
                line += 'n/a'
        print(line)


if __name__ == "__main__":
    static_analysis = print_static_analysis_results()
    print("")
    print("")
    dynamic_analysis = print_runtime_results()
    print("")
    print("")
    print_overall_results(static_analysis, dynamic_analysis)
