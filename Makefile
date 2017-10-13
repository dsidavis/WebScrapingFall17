MD_FILES=Outline.md Scraping.md HTTP.md Inflation.md directEnergy.Rmd XPath.md Selenium.md

HTML_FILES=$(patsubst %.md,%.html,$(patsubst %.Rmd,%.html,$(MD_FILES)))

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
