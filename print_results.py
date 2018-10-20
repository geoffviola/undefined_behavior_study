#!/usr/bin/env python3

import csv
import os
from collections import defaultdict

results = {}

for root, subdirs, files in os.walk('.'):
  for f in files:
    if f.find("results.txt") != -1:
      filename = root + "/" + f
      results[filename] = csv.reader(open(root + "/" + f), delimiter=' ')

cool_x = "❌"
cool_check = "✔️"

output_table = defaultdict(lambda : defaultdict(lambda : defaultdict(lambda : defaultdict(str))))

for filename, csv in results.items():
  if filename.find("valgrind") != -1:
    analyzer = "valgrind"
  elif filename.find("sanitize") != -1:
    analyzer=""
    if filename.find("address") != -1:
      analyzer += "asan"
    if filename.find("memory") != -1:
      analyzer += "msan"
    if filename.find("undefined") != -1:
      if len(analyzer) > 0:
        analyzer += ","
      analyzer += "ubsan"
  else:
    analyzer = ""
  if filename.find("gcc") != -1:
    compiler = "gcc"
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
    output_table[first_section][compiler][row[0].replace("_", " ")][str(debug_mode)] = result

print ("## Runtime Crashes")
print ("### Breakdown")
print("Compiler | Undefined Behavior Type | Debug | RelWithDebInfo")
print("--- | --- | --- | ---")
no_tool_test_table = defaultdict(lambda : defaultdict(lambda : defaultdict(str)))
for tool, rest_0 in sorted(output_table.items()):
  if tool == "":
    for compiler, rest_1 in sorted(rest_0.items()):
      for test, rest_2 in sorted(rest_1.items()):
        no_tool_test_table[test][compiler]["1"] = rest_2["1"]
        no_tool_test_table[test][compiler]["0"] = rest_2["0"]
        print(compiler + " | " + test + " | " + rest_2["1"] + " | " + rest_2["0"])

print("")
print("### Summary")
print("Undefined Behavior | clang D | gcc D | clang R | gcc R")
print("--- | --- | --- | --- | ---")
for test, rest_0 in sorted(no_tool_test_table.items()):
  line = test + " | "
  for compiler, rest_1 in sorted(rest_0.items()):
    line += rest_1["1"] + " | "
  for compiler, rest_1 in sorted(rest_0.items()):
    line += rest_1["0"] + " | "
  print(line)

print("")
print("")
print ("## Dynamic Analysis")
print ("### Breakdown")
print("Compiler | Undefined Behavior Type | Debug | RelWithDebInfo")
print("--- | --- | --- | ---")
tool_test_table = defaultdict(lambda : defaultdict(lambda : defaultdict(lambda : defaultdict(str))))
for tool, rest_0 in sorted(output_table.items()):
  if tool != "":
    for compiler, rest_1 in sorted(rest_0.items()):
      for test, rest_2 in sorted(rest_1.items()):
        tool_test_table[test][tool]["1"] = rest_2["1"]
        tool_test_table[test][tool]["0"] = rest_2["0"]
        print(tool + " | " + test + " | " + rest_2["1"] + " | " + rest_2["0"])

print("")
print ("### Summary")
print("Undefined Behavior Type | asan D | asan,ubsan D | msan D | msan,ubsan D | valgrind D | asan D | asan,ubsan D | msan D | msan,ubsan D | valgrind D")
print("--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---")
for test, rest_0 in sorted(tool_test_table.items()):
  line = test + " | "
  for tool, rest_1 in sorted(rest_0.items()):
    line += rest_1["1"] + " | "
  for compiler, rest_1 in sorted(rest_0.items()):
    line += rest_1["0"] + " | "
  print(line)

