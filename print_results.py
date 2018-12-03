#!/usr/bin/env python3
# coding=utf-8

import csv
import os
from collections import defaultdict

cool_x = "❌"
cool_check = "✔️"


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

        debug_mode = -1
        if "debug" in filename:
            debug_mode = 1
        if "rel_with_deb_info" in filename:
            debug_mode = 0

        for row in csv:
            if row[0] == "no_undefined_behavior":
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
            if len(output_table[tool][test_name][debug_mode]) == 0 or (output_table[tool][test_name][debug_mode] == "1" and len(result) > 0):
                output_table[tool][test_name][debug_mode] = result

    return output_table


def print_compiler_warnings(output_table):
    print("### Compiler Warnings")
    print("Compiler | Undefined Behavior Type | Warning | Warning Opt | Name")
    print("--- | --- | --- | --- | ---")
    for compiler, rest_0 in sorted(output_table.items()):
        for test, rest_1 in sorted(rest_0.items()):
            rest_1_dict = dict(rest_1)
            if -1 in rest_1_dict:
                continue
            warning_opt = cool_check if len(rest_1_dict[0]) > 0 else cool_x
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
    print("### Static Analyzers")
    print("Tool | Undefined Behavior Type | Warning | Name")
    print("--- | --- | --- | --- | ---")
    for tool, rest_0 in sorted(output_table.items()):
        for test, rest_1 in sorted(rest_0.items()):
            if not -1 in dict(rest_1):
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
    print("### Summary")
    optimization_dependent_results = []
    summary_table = defaultdict(lambda: defaultdict(lambda: defaultdict(int)))
    tool_line = "Undefined Behavior Type"
    tool_table_line = "---"
    tools = []
    for tool, rest_0 in sorted(output_table.items()):
        tools.append(tool)
        tool_line += " | " + tool
        tool_table_line = " | ---"
        for test, rest_1 in sorted(rest_0.items()):
            warning_result = -1
            for optimization, warning in sorted(rest_1.items()):
                if len(warning) > 0:
                    other_optimization = False
                    if warning_result == -1 or warning_result == 1:
                        warning_result = 1
                    else:
                        warning_result = 2
                else:
                    if warning_result == -1 or warning_result == 0:
                        warning_result = 0
                    else:
                        warning_result = 2
                        other_optimization = True

                if warning_result == 2:
                    optimization_name = "unoptimized" if not other_optimization and optimization == 1 else "optimized"
                    optimization_dependent_result = tool + " \"" + test + "\""
                    optimization_dependent_result += " emitted warning only for "
                    optimization_dependent_result += optimization_name + " build"
                    optimization_dependent_results.append(
                        optimization_dependent_result)
            summary_table[test][tool] = warning_result

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

            warning_symbol = ""
            assert(rest_1 >= 0 and rest_1 <= 2)
            if rest_1 == 0:
                warning_symbol = cool_x
            elif rest_1 == 1:
                warning_symbol = cool_check
            elif rest_1 == 2:
                warning_symbol = cool_check + "*"
            output_line += " | " + warning_symbol
        while tool_index < len(tools):
            tool_index += 1
            output_line += " | n/a"
        print(output_line)

    for optimization_dependent_result in optimization_dependent_results:
        print("* " + optimization_dependent_result)


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
            if "address" in filename:
                analyzer += "asan"
            if "memory" in filename:
                analyzer += "msan"
            if "undefined" in filename:
                if len(analyzer) > 0:
                    analyzer += ","
                analyzer += "ubsan"
        else:
            analyzer = ""
        if "gcc" in filename:
            compiler = "gcc"
        elif "msvc" in filename:
            compiler = "msvc"
        else:
            compiler = "clang"
        if analyzer == "":
            first_section = ""
        else:
            first_section = analyzer
        if filename.find("debug") != -1:
            debug_mode = 1
        else:
            debug_mode = 0
        for row in csv:
            if row[0] == "no_undefined_behavior":
                if row[1] != "0":
                    print(filename, "broken")
                    exit(1)
                continue
            if row[1] != "0":
                result = cool_check
            else:
                result = cool_x
            output_table[first_section][compiler][row[0].replace(
                "_", " ")][str(debug_mode)] = result
    return output_table


def print_runtime_crashes(output_table):
    print("## Runtime Crashes")
    print("### Breakdown")
    print("Compiler | Undefined Behavior Type | Debug | RelWithDebInfo")
    print("--- | --- | --- | ---")
    no_tool_test_table = defaultdict(
        lambda: defaultdict(lambda: defaultdict(str)))
    compilers = []
    for tool, rest_0 in sorted(output_table.items()):
        if tool == "":
            for compiler, rest_1 in sorted(rest_0.items()):
                compilers.append(compiler)
                for test, rest_2 in sorted(rest_1.items()):
                    no_tool_test_table[test][compiler]["1"] = rest_2["1"]
                    no_tool_test_table[test][compiler]["0"] = rest_2["0"]
                    print(compiler + " | " + test + " | " +
                          rest_2["1"] + " | " + rest_2["0"])

    print("")
    print("### Summary")
    tool_print_line = "Undefined Behavior"
    tool_delim_print_line = "---"
    tool_print_line_r = ""
    for compiler in compilers:
        tool_print_line += " | " + compiler + " D"
        tool_print_line_r += " | " + compiler + "R"
        tool_delim_print_line += " | --- | ---"
    tool_print_line += tool_print_line_r 
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
            line += " | " + rest_1["1"]
            line_r += " | " +  rest_1["0"]
        while compiler_index < len(compilers):
            compiler_index += 1
            line += " | n/a"
            line_r += " | n/a"
        line += line_r
        print(line)


def print_dynamic_analysis(output_table):
    print("## Dynamic Analysis")
    print("### Breakdown")
    print("Compiler | Undefined Behavior Type | Debug | RelWithDebInfo")
    print("--- | --- | --- | ---")
    tool_test_table = defaultdict(lambda: defaultdict(
        lambda: defaultdict(lambda: defaultdict(str))))
    for tool, rest_0 in sorted(output_table.items()):
        if tool != "":
            for compiler, rest_1 in sorted(rest_0.items()):
                for test, rest_2 in sorted(rest_1.items()):
                    tool_test_table[test][tool]["1"] = rest_2["1"]
                    tool_test_table[test][tool]["0"] = rest_2["0"]
                    print(tool + " | " + test + " | " +
                          rest_2["1"] + " | " + rest_2["0"])

    print("")
    print("### Summary")
    print("### Debug")
    dynamic_analysis_summary_row = "--- | --- | --- | --- | --- | --- | ---"
    print("Undefined Behavior Type | asan D | asan,ubsan D | msan D | msan,ubsan D | ubsan D | valgrind D"
          )
    print(dynamic_analysis_summary_row)
    for test, rest_0 in sorted(tool_test_table.items()):
        line = test + " | "
        for compiler, rest_1 in sorted(rest_0.items()):
            line += rest_1["1"] + " | "
        print(line[:-3])

    print("### Release")
    print("Undefined Behavior Type | asan R | asan,ubsan R | msan R | msan,ubsan R | ubsan R | valgrind R")
    print(dynamic_analysis_summary_row)
    for test, rest_0 in sorted(tool_test_table.items()):
        line = test + " | "
        for compiler, rest_1 in sorted(rest_0.items()):
            line += rest_1["0"] + " | "
        print(line[:-3])


def print_runtime_results():
    runtime_results = read_runtime_results()
    output_table = process_runtime_results(runtime_results)
    print_runtime_crashes(output_table)
    print("")
    print("")
    print_dynamic_analysis(output_table)


def print_static_analysis_results():
    static_analysis_results = read_static_analysis()
    output_table = process_static_analysis_results(static_analysis_results)
    print("## Static Analysis")
    print_compiler_warnings(output_table)
    print("")
    print_tool_static_analysis(output_table)
    print("")
    print_static_analysis_summary(output_table)


if __name__ == "__main__":
    print_static_analysis_results()
    print("")
    print("")
    print_runtime_results()
