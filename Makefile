MD_FILES  = $(shell find site -type f -name *.md | sort)
JSON_FILES = $(patsubst site/%.md, build/%.json, $(MD_FILES))

.PHONY: all
all: convert 

.PHONY: convert code
convert: $(JSON_FILES)
code: convert

.PHONY: codefiles
codefiles: $(MD_FILES)
	@for f in $(MD_FILES); do echo $$f; done

build/%.json: site/%.md
	@echo convert "$<" as "$@"
	@m2j  "$<" | jq '.[]' | sed -e "s#[\"]basename[\"]#\"id\"#g" > "$@" 


clean:
	rm -rf build/profiles/*.json