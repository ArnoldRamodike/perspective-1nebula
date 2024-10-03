using System;
using System.Collections.Generic;

public class Program
{
    public static string Likes(List<string> names)
    {
        int count = names.Count;

        if (count == 0)
        {
            return "no one likes this";
        }
        else if (count == 1)
        {
            return $"{names[0]} likes this";
        }
        else if (count == 2)
        {
            return $"{names[0]} and {names[1]} like this";
        }
        else if (count == 3)
        {
            return $"{names[0]}, {names[1]} and {names[2]} like this";
        }
        else
        {
            return $"{names[0]}, {names[1]} and {count - 2} others like this";
        }
    }

    public static void Main(string[] args)
    {
        Console.WriteLine(Likes(new List<string>()));
        Console.WriteLine(Likes(new List<string> { "Peter" }));
        Console.WriteLine(Likes(new List<string> { "Jacob", "Alex" }));
        Console.WriteLine(Likes(new List<string> { "Max", "John", "Mark" }));
        Console.WriteLine(Likes(new List<string> { "Alex", "Jacob", "Mark", "Max", "Arnold" }));
    }
}
