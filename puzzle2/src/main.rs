//use std::env;
use std::fs;
fn main() {
    let contents = fs::read_to_string("input.txt").expect("error reading file");
    let mut contents_iter = contents.lines();

    let mut window1: u32 = contents_iter.next().unwrap().parse().unwrap();
    let mut window2: u32 = contents_iter.next().unwrap().parse().unwrap();
    let mut window3: u32 = contents_iter.next().unwrap().parse().unwrap();

    let mut increases: u32 = 0;

    while let Some(d) = contents_iter.next() {
        let new_depth: u32 = d.parse().unwrap();

        //let old_sum = window1 + window2 + window3;
        //let new_sum = window2 + window3 + new_depth;
        let old_sum = window1;
        let new_sum = new_depth;

        if new_sum > old_sum {
            increases += 1;
        }

        window1 = window2;
        window2 = window3;
        window3 = new_depth;
    }

    println!("{}", increases);
}
