+++
date = "2017-01-09T11:20:28+01:00"
draft = false
title = "Parse CSV files with FreeBSD"

+++

I recently read [a blog post by Dale Scott where he lists several options for parsing CSV files on UNIX systems][1]. Unfortunately, the comment section is closed, so I decided to add some lines here.

In his article, Dale names 6 and describes 4 options for parsing CSV files on FreeBSD, namely:

- [csvfix][2]
- [csvkit][3]
- [csvprintf][4]
- [csvtool][5]

My personal use case is to parse a CSV file that contains crash reports for an app in Google Play Store. I need a software that accepts a CSV file and a format string (i.e. "App Version %1, Exception %2…")
and fills the placeholders with CSV columns. I tried to achieve this with csvtool first, which is present in the FreeBSD ports tree (`textproc/ocaml-csv`).

## csvtool

I started developing my script using ocaml-csv, which has a very handy program `csvtool`, which accepts an input file and a format string, just as I wanted:

    jb@jb-mbp:~ % cat tmp/sample.csv 
    name,type,food
    John,nice,pizza
    Sue,sweet,taco
    jb@jb-mbp:~ % csvtool drop 1 tmp/sample.csv | csvtool format "%1 is a %2 %3 eater\n" -
    John is a nice pizza eater
    Sue is a sweet taco eater

After installing `textproc/ocaml-csv` on my FreeBSD box, I figured that `csvtool` is not installed as part of it. The sources for `csvtool` can be found here:

    root@jb:~ # ls /usr/obj/usr/ports/textproc/ocaml-csv/work/csv-1.2.1/examples/
    .depend.ocaml Makefile      csvtool       csvtool.annot csvtool.cmi   csvtool.cmo   csvtool.exe   csvtool.ml    example.annot example.cmi   example.cmo   example.exe   example.ml    example1.csv  example2.csv

I might look into this when I find the time, but I had to get this script working, so I took a look at `csvkit` instead, which you should find at `textproc/py-csvkit`. `csvkit` comes with several tools, but I will only use two of them, `csvcut` and `csvformat`.

## csvcut
`csvcut` lets you select columns from your input CSV file:

    usage: csvcut [-h] [-d DELIMITER] [-t] [-q QUOTECHAR] [-u {0,1,2,3}] [-b]
		  [-p ESCAPECHAR] [-z MAXFIELDSIZE] [-e ENCODING] [-S] [-H] [-v]
		  [-l] [--zero] [-n] [-c COLUMNS] [-C NOT_COLUMNS] [-x]
		  [FILE]

    Filter and truncate CSV files. Like unix "cut" command, but for tabular data.

    positional arguments:
      FILE                  The CSV file to operate on. If omitted, will accept
			    input on STDIN.

    optional arguments:
      -h, --help            show this help message and exit
      -d DELIMITER, --delimiter DELIMITER
			    Delimiting character of the input CSV file.
      -t, --tabs            Specifies that the input CSV file is delimited with
			    tabs. Overrides "-d".
      -q QUOTECHAR, --quotechar QUOTECHAR
			    Character used to quote strings in the input CSV file.
      -u {0,1,2,3}, --quoting {0,1,2,3}
			    Quoting style used in the input CSV file. 0 = Quote
			    Minimal, 1 = Quote All, 2 = Quote Non-numeric, 3 =
			    Quote None.
      -b, --doublequote     Whether or not double quotes are doubled in the input
			    CSV file.
      -p ESCAPECHAR, --escapechar ESCAPECHAR
			    Character used to escape the delimiter if --quoting 3
			    ("Quote None") is specified and to escape the
			    QUOTECHAR if --doublequote is not specified.
      -z MAXFIELDSIZE, --maxfieldsize MAXFIELDSIZE
			    Maximum length of a single field in the input CSV
			    file.
      -e ENCODING, --encoding ENCODING
			    Specify the encoding the input CSV file.
      -S, --skipinitialspace
			    Ignore whitespace immediately following the delimiter.
      -H, --no-header-row   Specifies that the input CSV file has no header row.
			    Will create default headers.
      -v, --verbose         Print detailed tracebacks when errors occur.
      -l, --linenumbers     Insert a column of line numbers at the front of the
			    output. Useful when piping to grep or as a simple
			    primary key.
      --zero                When interpreting or displaying column numbers, use
			    zero-based numbering instead of the default 1-based
			    numbering.
      -n, --names           Display column names and indices from the input CSV
			    and exit.
      -c COLUMNS, --columns COLUMNS
			    A comma separated list of column indices or names to
			    be extracted. Defaults to all columns.
      -C NOT_COLUMNS, --not-columns NOT_COLUMNS
			    A comma separated list of column indices or names to
			    be excluded. Defaults to no columns.
      -x, --delete-empty-rows
			    After cutting, delete rows which are completely empty.

## csvformat
`csvformat` lets you change the format of your CSV file. You can also pipe `csvcut` into `csvformat` (which I do):

    usage: csvformat [-h] [-d DELIMITER] [-t] [-q QUOTECHAR] [-u {0,1,2,3}] [-b]
		     [-p ESCAPECHAR] [-z MAXFIELDSIZE] [-e ENCODING] [-S] [-v]
		     [-D OUT_DELIMITER] [-T] [-Q OUT_QUOTECHAR] [-U {0,1,2,3}]
		     [-B] [-P OUT_ESCAPECHAR] [-M OUT_LINETERMINATOR]
		     [FILE]

    Convert a CSV file to a custom output format.

    positional arguments:
      FILE                  The CSV file to operate on. If omitted, will accept
			    input on STDIN.

    optional arguments:
      -h, --help            show this help message and exit
      -d DELIMITER, --delimiter DELIMITER
			    Delimiting character of the input CSV file.
      -t, --tabs            Specifies that the input CSV file is delimited with
			    tabs. Overrides "-d".
      -q QUOTECHAR, --quotechar QUOTECHAR
			    Character used to quote strings in the input CSV file.
      -u {0,1,2,3}, --quoting {0,1,2,3}
			    Quoting style used in the input CSV file. 0 = Quote
			    Minimal, 1 = Quote All, 2 = Quote Non-numeric, 3 =
			    Quote None.
      -b, --doublequote     Whether or not double quotes are doubled in the input
			    CSV file.
      -p ESCAPECHAR, --escapechar ESCAPECHAR
			    Character used to escape the delimiter if --quoting 3
			    ("Quote None") is specified and to escape the
			    QUOTECHAR if --doublequote is not specified.
      -z MAXFIELDSIZE, --maxfieldsize MAXFIELDSIZE
			    Maximum length of a single field in the input CSV
			    file.
      -e ENCODING, --encoding ENCODING
			    Specify the encoding the input CSV file.
      -S, --skipinitialspace
			    Ignore whitespace immediately following the delimiter.
      -v, --verbose         Print detailed tracebacks when errors occur.
      -D OUT_DELIMITER, --out-delimiter OUT_DELIMITER
			    Delimiting character of the output CSV file.
      -T, --out-tabs        Specifies that the output CSV file is delimited with
			    tabs. Overrides "-D".
      -Q OUT_QUOTECHAR, --out-quotechar OUT_QUOTECHAR
			    Character used to quote strings in the output CSV
			    file.
      -U {0,1,2,3}, --out-quoting {0,1,2,3}
			    Quoting style used in the output CSV file. 0 = Quote
			    Minimal, 1 = Quote All, 2 = Quote Non-numeric, 3 =
			    Quote None.
      -B, --out-doublequote
			    Whether or not double quotes are doubled in the output
			    CSV file.
      -P OUT_ESCAPECHAR, --out-escapechar OUT_ESCAPECHAR
			    Character used to escape the delimiter in the output
			    CSV file if --quoting 3 ("Quote None") is specified
			    and to escape the QUOTECHAR if --doublequote is not
			    specified.
      -M OUT_LINETERMINATOR, --out-lineterminator OUT_LINETERMINATOR
			    Character used to terminate lines in the output CSV
			    file.

(To be continued)


[1]: http://www.dalescott.net/manipulating-csv-format-files-on-unix/
[2]: http://neilb.bitbucket.org/csvfix
[3]: https://github.com/wireservice/csvkit
[4]: https://github.com/archiecobbs/csvprintf
[5]: https://github.com/Chris00/ocaml-csv
