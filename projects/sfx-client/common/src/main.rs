mod random;

fn main() {
    let result = random::random_string(16, true,
                                       true, true, false);

    println!("value: {}", result);
}