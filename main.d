#!/usr/bin/env rdmd

import core.stdc.stdlib; // exit()
import std.algorithm;
import std.array; // array(), split()
import std.conv;
import std.file; // dirEntries()
import std.format;
import std.path; // baseName()
import std.stdio;
import std.string;

enum PREFIX = "lattam";

string zfill(const string s, const size_t width)
{
    return s.rightJustify(width, '0');
}

void process_arg(const string arg, const size_t no_of_entries)
{
    if (no_of_entries > 0)
    {
        writefln("Error: an entry with prefix %s_ already exists!", PREFIX);
        exit(1);
    }
    // else:
    try
    {
        int num = arg.to!int;
    }
    catch (ConvException e)
    {
        writeln("Error: provide a number!");
        exit(1);
    }
    const s = arg.zfill(2);
    const dname = PREFIX ~ "_" ~ s;
    mkdir(dname);
    writefln("%s/ was created", dname);
}

void main(const string[] args)
{
    const entries = dirEntries(".", format("%s_*", PREFIX), SpanMode.shallow).map!(
            e => e.baseName).array;

    if (args.length > 1)
    {
        process_arg(args[1], entries.length);
        exit(0);
    }
    // else:

    if (entries.length == 0)
    {
        const dname = PREFIX ~ "_00";
        mkdir(dname);
        writefln("%s/ was created", dname);
        exit(0);
    }
    // else:
    const entry = entries[0];
    string right;
    formattedRead(entry.dup, PREFIX ~ "_%s", right);
    const num = right.to!int;
    const new_right = (num + 1).to!string.zfill(right.length);
    const new_name = PREFIX ~ "_" ~ new_right;
    std.file.rename(entry, new_name);
    writefln("%s/ -> %s/", entry, new_name);
}
