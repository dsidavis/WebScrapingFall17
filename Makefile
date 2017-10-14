MD_FILES=Outline.md Scraping.md HTTP.md Inflation.md XPath.md Selenium.md

# directEnergy.md

HTML_FILES=$(patsubst %.md,%.html,$(MD_FILES))

all: $(HTML_FILES)
	@echo "Done"

%.html: %.md
	markdown $< -h -s  OmegaTech.css > $@

%.html: %.Rmd
	markdown $< -h -s  OmegaTech.css > $@	

ship:
	scp *.R $(HTML_FILES)  anson:dsi/WebScraping

what:
	@echo "$(HTML_FILES)"
