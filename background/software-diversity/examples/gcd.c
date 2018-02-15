int gcd(int n, int m) {
	int temp;
	while (m != 0) {
		temp = n % m;

		n = m;
		m = temp;
	}
	return n;
}
