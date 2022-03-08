mod random;

fn main() {
    let result = random::random_string(16, false,
                                       false, false, false);

    println!("value: {}", result);
}