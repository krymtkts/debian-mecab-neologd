FROM php:7.4-apache

RUN apt update && apt install -y apt-utils mecab libmecab-dev mecab-ipadic-utf8 sudo zip unzip gnupg wget lv vim git

# NOTE: download source dictionaries directly to skip downloading from OSDN (extremely slow).
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
    && mkdir ./mecab-ipadic-neologd/build/ \
    && curl --insecure -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" -o "./mecab-ipadic-neologd/build/mecab-ipadic-2.7.0-20070801.tar.gz"  || true \
    && ./mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y \
    && rm -rf ./mecab-ipadic-neologd

RUN git clone --depth 1 https://github.com/neologd/mecab-unidic-neologd.git \
    && mkdir ./mecab-unidic-neologd/build/ \
    && curl --insecure -L "https://clrd.ninjal.ac.jp/unidic_archive/cwj/2.1.2/unidic-mecab-2.1.2_src.zip" -o "./mecab-unidic-neologd/build/unidic-mecab-2.1.2_src.zip"  || true \
    && ./mecab-unidic-neologd/bin/install-mecab-unidic-neologd -n -y  \
    && rm -rf ./mecab-unidic-neologd

CMD ["/bin/bash"]
