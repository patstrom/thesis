tex=latexmk

.PHONY: thesis
thesis:
	$(tex) -pdf main.tex -output-directory=build/target
	mv build/target/main.pdf build/

.PHONY: presentation
presentation:
	$(tex) presentation.tex -output-directory=build/presentation
	mv build/presentation/presentation.pdf build/

.PHONY: clean
clean:
	rm -rf build/*

.PHONY: check
check:
	find . -name "*.tex" -exec aspell -tb check "{}" \;

