#include <gecode/int.hh>
#include <gecode/search.hh>
#include <gecode/minimodel.hh>
#include <gecode/gist.hh>

using namespace Gecode;

class SendMoreMoney : public Space {
	protected:
		IntVarArray l;
	public:
		SendMoreMoney(void) : l(*this, 8, 0 ,9) {
			IntVar s(l[0]), e(l[1]), n(l[2]), d(l[3]),
				m(l[4]), o(l[5]), r(l[6]), y(l[7]);

			// s and m are nonzero
			rel(*this, s != 0);
			rel(*this, m != 0);

			// All letters are pairwise distinct
			distinct(*this, l);

			// The linear equation constraint
			rel(*this, 1000*(s+m) + 100*(e+o) + 10*(n+r) + 1*(d+e) \
					== 1000*m + 1000*o + 100*n + 10*e + 1*y);

			// Our search / branching heuristic
			// Pick the variable with the smallest domain and branch on the
			// smallest value in that domain.
			branch(*this, l, INT_VAR_SIZE_MIN(), INT_VAL_MIN());
		}

		SendMoreMoney(bool share, SendMoreMoney& s) : Space(share, s) {
			l.update(*this, share, s.l);
		}

		virtual Space* copy(bool share) {
			return new SendMoreMoney(share, *this);
		}

		void print(std::ostream& os) const {
			os << "{s : " << l[0] << ", e : " << l[1] << ", n : " << l[2]
				<< ", d : " << l[3] << ", m : " << l[4] << ", o : " << l[5]
				<< ", r : " << l[6] << ", y : " << l[7] << "}";
		}

		// Specify how we omptimize the solution when searching
		virtual void constrain(const Space& _b) {
			const SendMoreMoney& b = static_cast<const SendMoreMoney&>(_b);
			IntVar e(l[1]), n(l[2]), m(l[4]), o(l[5]), y(l[7]);
			IntVar b_e(b.l[1]), b_n(b.l[2]), b_m(b.l[4]), b_o(b.l[5]), b_y(b.l[7]);

			int last_solution = ( 10000*b_m.val() + 1000*b_o.val() + 100*b_n.val() + 10*b_e.val()
					+ 1*b_y.val() );

				// Add a constraint that our variables should make MONEY larger than
				// last solution found.
				rel(*this, 10000*m + 1000*o + 100*n + 10*e + 1*y > last_solution);
		}
};

int main() {
	try {
		SendMoreMoney *m = new SendMoreMoney;
		Gist::Print<SendMoreMoney> p("Print solution");
		Gist::Options o;
		o.inspect.click(&p);
		Gist::bab(m, o);
		delete m;
	} catch (Exception e) {
		std::cerr << "Gecode exception: " << e.what() << std::endl;
		return 1;
	}
	return 0;
}
