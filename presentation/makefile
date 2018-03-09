tex=latexmk

.PHONY: presentation
presentation:
	$(tex) -pdf presentation.tex -output-directory=build/presentation
	mv build/presentation/presentation.pdf build/

.PHONY: clean
clean:
	rm -rf build/*
