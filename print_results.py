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

#output_table = defaultdict(lambda : defaultdict(lambda : defaultdict(str)))
output_table = defaultdict(lambda : defaultdict(lambda : defaultdict(lambda : defaultdict(str))))

for filename, csv in results.items():
  if filename.find("valgrind") != -1:
    analyzer = "valgrind"
  elif filename.find("sanitize") != -1:
    analyzer = "clang "
    if filename.find("address") != -1:
      analyzer += "address"
    if filename.find("memory") != -1:
      analyzer += "memory"
    if filename.find("undefined") != -1:
      if analyzer[-1] != " ":
        analyzer += ","
      analyzer += "undefined" 
    analyzer += " sanitizer"
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
    output_table[first_section][compiler][row[0]][str(debug_mode)] = result

print("Tool | Compiler | Undefined Behavior | Type | Debug | RelWithDebInfo")
for tool, rest_0 in sorted(output_table.items()):
  for compiler, rest_1 in sorted(rest_0.items()):
    for test, rest_2 in sorted(rest_1.items()):
      first_section = ""
      if tool != "":
        first_section = tool + " | "
      print(first_section + compiler + " | " + test.replace("_", " ") + " | " + rest_2["1"] + " | " + rest_2["0"])

