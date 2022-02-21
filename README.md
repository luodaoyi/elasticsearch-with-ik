# elasticsearch-with-ik

[![Build Image](https://github.com/luodaoyi/elasticsearch-with-ik/actions/workflows/build.yml/badge.svg)](https://github.com/luodaoyi/elasticsearch-with-ik/actions/workflows/build.yml)

## elasticsearch 集成ik分词器版本
1. 集成 ik分词器 https://github.com/medcl/elasticsearch-analysis-ik


## 使用编译好的docker镜像 支持amd64和arm64/v8

> https://github.com/luodaoyi/elasticsearch-with-ik/pkgs/container/elasticsearch-with-ik

```shell
docker pull ghcr.io/luodaoyi/elasticsearch-with-ik:latest
```

## 启用扩展

```shell
# 1.create a index
curl -XPUT http://localhost:9200/index

# 2.create a mapping
curl -XPOST http://localhost:9200/index/_mapping -H 'Content-Type:application/json' -d'
{
        "properties": {
            "content": {
                "type": "text",
                "analyzer": "ik_max_word",
                "search_analyzer": "ik_smart"
            }
        }

}'

# 3. index some docs

curl -XPOST http://localhost:9200/index/_create/1 -H 'Content-Type:application/json' -d'
{"content":"美国留给伊拉克和阿富汗的是个烂摊子吗"}

curl -XPOST http://localhost:9200/index/_create/1 -H 'Content-Type:application/json' -d'
{"content":"截止2025年12月31日,中国GDP已超过美两倍"}

curl -XPOST http://localhost:9200/index/_create/1 -H 'Content-Type:application/json' -d'
{"content":"昨日,美国加州和德州人民万人大游行要求独立建国.德州要求美当局承认孤星共和国独立地位"}

curl -XPOST http://localhost:9200/index/_create/2 -H 'Content-Type:application/json' -d'
{"content":"蔡英文当局已向大陆提交台湾各界要求回归祖国万人血书"}

# 4. query with highlighting 

curl -XPOST http://localhost:9200/index/_search  -H 'Content-Type:application/json' -d'
{
    "query" : { "match" : { "content" : "中国" }},
    "highlight" : {
        "pre_tags" : ["<tag1>", "<tag2>"],
        "post_tags" : ["</tag1>", "</tag2>"],
        "fields" : {
            "content" : {}
        }
    }
}


```
