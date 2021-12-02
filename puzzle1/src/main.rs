//use std::env;
use std::fs;
fn main() {
    let contents = fs::read_to_string("input.txt").expect("error reading file");
    let mut contents_iter = contents.lines();

    let mut last: u32 = contents_iter.next().unwrap().parse().unwrap();

    let mut increases: u32 = 0;

    while let Some(depth) = contents_iter.next() {
        let depth_int: u32 = depth.parse().unwrap();

        if depth_int > last {
            increases += 1;
        }
        last = depth_int;
    }

    println!("{}", increases);
}
