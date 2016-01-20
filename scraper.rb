#!/bin/env ruby
# encoding: utf-8

require 'pry'
require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/ukraine-deputies-wikipedia', column: 'wikiname')
EveryPolitician::Wikidata.scrape_wikidata(names: { uk: names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder

