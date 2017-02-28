#!/bin/env ruby
# encoding: utf-8

require 'pry'
require 'wikidata/fetcher'

sparq = <<EOS
  SELECT ?item
  WHERE {
    ?item p:P39 ?position_statement .
    ?position_statement ps:P39 wd:Q12132454 ;    # People's Deputy of Ukraine
                        pq:P2937 wd:Q18562210 .  #   parliamentary term: 8th
  }
EOS
ids = EveryPolitician::Wikidata.sparql(sparq)

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/ukraine-deputies-wikipedia', column: 'wikiname')
EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { uk: names })
