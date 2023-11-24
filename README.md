# Debian MeCab NEologd

Test container image for [neologd/mecab-ipadic-neologd: Neologism dictionary based on the language resources on the Web for mecab-ipadic](https://github.com/neologd/mecab-ipadic-neologd).
Configured to download source dictionaries directly to skip downloading from OSDN (extremely slow).

```powershell
docker build --tag mecab-neologd .

docker run -it mecab-neologd
# mecab -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd
# mecab -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-unidic-neologd
```
