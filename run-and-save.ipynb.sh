FILE_PY="$1"
if [[ -z "$FILE_PY" || ! -f "$FILE_PY" ]]; then
  echo "Использование: $0 <file.py>"
  exit 1
fi

jupytext --sync "$FILE_PY"

FILE_IPYNB="${FILE_PY%.py}.ipynb"

jupyter nbconvert --to notebook --execute --output "$FILE_IPYNB" "$FILE_IPYNB"

echo "File saved to $FILE_IPYNB"
