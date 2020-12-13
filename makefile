cards.pdf: cards.tex cards.mp
	mpost cards.mp
	latexmk -pdf cards.tex

cards.mp: twenty-four.py
	python twenty-four.py > cards.mp

clean:
	rm cards.mp
	rm card*.mps
	rm cards.aux
	rm cards.log
	rm cards.fls
	rm cards.fdb_latexmk