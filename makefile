tex=latexmk

.PHONY: thesis
thesis:
	$(tex) -pdf main.tex -output-directory=build/target
	mv build/target/main.pdf build/

.PHONY: clean
clean:
	rm -rf build/*

.PHONY: check
check:
	find . -name "*.tex" -exec aspell -tb check "{}" \;
