# Makefile for LaTeX project

# メインのTexファイル名（拡張子なし）
MAIN = main

# 中間ファイルの拡張子リスト
CLEAN_FILES = *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.synctex.gz *.toc

# デフォルトターゲット
all: build

# ドキュメントをビルド
build:
	latexmk -pdf -synctex=1 $(MAIN)

# 全ての中間ファイルを削除
clean:
	rm -f $(CLEAN_FILES)

# 中間ファイルを削除し、PDFも削除
distclean: clean
	rm -f $(MAIN).pdf

# ターゲットが実際のファイルではないことを宣言
.PHONY: all build clean distclean
