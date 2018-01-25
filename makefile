tex=latexmk

.PHONY: thesis
thesis:
	$(tex) -pdf main.tex -output-directory=./build
	mv build/main.pdf .

clean:
	rm -f build/*
	rm main.pdf
