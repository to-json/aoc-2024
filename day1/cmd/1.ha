use os;
use fmt;
use io;
use bufio;
use strings;
use ascii;
use strconv;
use sort;
use sort::cmp;
use math;

type problem_data =  struct {
	s: str,
	lines: []str,
};
export fn main() void = {
	let source = os::open("today.txt")!;
	let data = io::drain(source)!;
	let string_data = strings::fromutf8(data)!;
	let lines = strings::split(string_data, "\n");
	let left: []int = [];
	let right: []int = [];
	for (let line .. lines) {
		let (lstr, rstr) = strings::cut(line, " ");
		if (lstr != "") {
			let lint = strconv::stoi(lstr)!;
			append(left, lint);
		};
		if (rstr != "") {
			let rint = strconv::stoi(strings::ltrim(rstr))!;
			append(right, rint);

		};
	};
	sort::sort(left, size(int), &sort::cmp::ints);
	sort::sort(right, size(int), &sort::cmp::ints);
	let total: u64 = 0;
	let length = len(right);
	let i:size = 0;
	for (i<length; i += 1) {

		total += (math::absi(left[i]-right[i]));
	};
	fmt::println(total)!;
};

