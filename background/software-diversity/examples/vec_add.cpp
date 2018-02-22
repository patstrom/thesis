struct vec2 {
	float x, y;
	vec2(float x, float y) : x(x), y(y) {};
};

vec2 add(vec2 a, vec2 b) {
	return vec2(a.x + b.x, a.y + b.y);
}
