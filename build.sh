#!/usr/bin/env bash

case "$(uname -s)" in
    Darwin*)    command=open;;
    Linux*)     command=xdg-open;;
esac

LANGUAGE=$1

# rm triggers latexmk build even if previous artifacts generated by faulty run of po4a prevent it from running
rm -f main_${LANGUAGE}.aux && \
  po4a --no-update po4a.cfg && \
  latexmk -pdf -shell-escape main_${LANGUAGE}.tex && \
  ${command} main_${LANGUAGE}.pdf &
