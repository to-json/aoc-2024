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
	let content: []u8 = [];
	let fd = os::open("./today.txt")!;
	// io::readall(fd, content)!;
	let line = bufio::read_line(fd)!;
	// Example A
	let source = os::open("today.txt")!;
	let data = io::drain(source)!;
	let string_data = strings::fromutf8(data)!;
	let lines = strings::split(string_data, "\n");
	// let string_content = strings::fromutf8(content)!;
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
	let total = 0;
	let length:size = len(left);
	for (let i:size = 0; i<length; i += 1) {
		let ell = left[i];

		for (let j:size=0; j<length; j += 1) {
			if (right[j]<ell) {
				continue;
			} else if (right[j] == ell) {
				total += right[j];
			} else if (right[j] > ell) {
				break;
			};
		};

	};
	fmt::println(total)!;
};

