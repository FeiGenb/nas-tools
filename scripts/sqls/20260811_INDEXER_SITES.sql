-- Auto generated migration: import indexer rules from hsuyelin v3.4.1 user.sites.bin
-- 自动生成的迁移：从 hsuyelin v3.4.1 user.sites.bin 导入索引器规则
-- Date: 20260811
-- Sites: 28 (old hsuyelin sites not present in frostyleave by ID or domain)
-- 导入站点: 28 个（按 ID 和域名双重去重后，真正缺失的站点）
-- frostyleave 原有: 91 IDs / 99 domains
-- hsuyelin 旧版: 100 sites

-- NYAA(INK): NYAA(INK) (https://nyaa.ink/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'NYAA(INK)', 'NYAA(INK)', 'https://nyaa.ink/', '{"paths":[{"path":"?f=0&c=0_0&q={keyword}","method":"get"}]}', '', 1, '{"list":{"selector":"table.torrent-list > tbody > tr"},"fields":{"id":{"selector":"a[href*=\"/view/\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title":{"selector":"td:nth-child(2) > a"},"details":{"selector":"td:nth-child(2) > a","attribute":"href"},"download":{"selector":"td:nth-child(3) > a[href*=\"/download/\"]","attribute":"href"},"date_added":{"selector":"td:nth-child(5)"},"size":{"selector":"td:nth-child(4)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"*":0}},"uploadvolumefactor":{"case":{"*":1}}}}', '{}', '{"render":false,"proxy":true,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8","browse":{"path":"?p={page}","start":1}}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- NYAA(SUKEBEI): NYAA(SUKEBEI) (https://sukebei.nyaa.si/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'NYAA(SUKEBEI)', 'NYAA(SUKEBEI)', 'https://sukebei.nyaa.si/', '{"paths":[{"path":"?f=0&c=0_0&q={keyword}","method":"get"}]}', '', 1, '{"list":{"selector":"table.torrent-list > tbody > tr"},"fields":{"id":{"selector":"a[href*=\"/view/\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title":{"selector":"td:nth-child(2) > a"},"details":{"selector":"td:nth-child(2) > a","attribute":"href"},"download":{"selector":"td:nth-child(3) > a[href*=\"/download/\"]","attribute":"href"},"date_added":{"selector":"td:nth-child(5)"},"size":{"selector":"td:nth-child(4)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"*":0}},"uploadvolumefactor":{"case":{"*":1}}}}', '{}', '{"render":false,"proxy":true,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8","browse":{"path":"?p={page}","start":1}}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- OK: OK (https://www.okpt.net/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'OK', 'OK', 'https://www.okpt.net/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- PTLSP: PTLSP (https://www.ptlsp.com/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'PTLSP', 'PTLSP', 'https://www.ptlsp.com/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- atongmu: 阿童木 (https://hdatmos.club/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'atongmu', '阿童木', 'https://hdatmos.club/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"replace","args":["?",""]},{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"imdbid":{"selector":"div.imdb_100 > a","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"date_elapsed":{"selector":"td:nth-child(4) > span","optional":true},"date_added":{"selector":"td:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"td:nth-child(5)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_2up":2,"img.pro_free2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"font.free,font.twoupfree,font.halfdown,font.twouphalfdown","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"table.torrentname > tr > td:nth-child(1)","remove":"a,img,b,font","contents":-1}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/电视剧"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- beiyouren: 北邮人 (https://byr.pt/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'beiyouren', '北邮人', 'https://byr.pt/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title":{"selector":"td:nth-child(3) > table.torrentname > tr > td.embedded > a > b"},"category":{"selector":"a[href*=\"torrents.php?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"imdbid":{"selector":"div.imdb_100 > a","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"date":{"selector":"td.rowfollow:nth-child(5)","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d<br%H:%M:%S"}]},"size":{"selector":"td.rowfollow:nth-child(6)"},"seeders":{"selector":"td.rowfollow:nth-child(7)"},"leechers":{"selector":"td.rowfollow:nth-child(8)"},"grabs":{"selector":"td.rowfollow:nth-child(9)"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"td > span > span > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d%H:%M:%S"}]},"description":{"selector":"td:nth-child(3) > table.torrentname > tr > td.embedded:nth-child(1)"},"labels":{"selector":"td.embedded > span.tags"}}}', '{"movie":[{"id":408,"cat":"Movies","desc":"Movies(电影)"}],"tv":[{"id":401,"cat":"TV","desc":"TV Series (剧集)"},{"id":404,"cat":"TV/Anime","desc":"Animations(动漫)"},{"id":405,"cat":"TV/Shows","desc":"TV Show/综艺"},{"id":409,"cat":"TV/Sports","desc":"TV Sports/体育"},{"id":410,"cat":"TV/Documentary","desc":"记录(Documentary)"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- bingqilin-fangwen2: 冰淇淋(fangwen2) (https://fangwen2.icc2022.top/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'bingqilin-fangwen2', '冰淇淋(fangwen2)', 'https://fangwen2.icc2022.top/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"replace","args":["?",""]},{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"imdbid":{"selector":"div.imdb_100 > a","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"date_elapsed":{"selector":"td:nth-child(4) > span","optional":true},"date_added":{"selector":"td:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"td:nth-child(5)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"img.pro_free,img.pro_free2up","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"td.embedded","remove":"a,b,img,span"},"labels":{"selector":"td.embedded > span[style]"},"minimumratio":{"text":1},"minimumseedtime":{"text":90000}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影","default":true}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片","default":true},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫","default":true},{"id":402,"cat":"TV","desc":"TV Series/电视剧","default":true},{"id":403,"cat":"TV","desc":"TV Shows/综艺","default":true}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- butterfly: 蝴蝶 (https://hudbt.hust.edu.cn/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'butterfly', '蝴蝶', 'https://hudbt.hust.edu.cn/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}","search_area":4},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table#torrents > tbody > tr"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"replace","args":["?",""]},{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"date_added":{"selector":"td:nth-child(4)"},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"td:nth-child(5)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"img.free":0,"img.twoupfree":0,"img.thirtypercent":0.3,"img.fiftypercent":0.5,"*":1}},"uploadvolumefactor":{"case":{"img.twoupfree":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"img.pro_free,img.pro_free2up","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"td:nth-child(2) > div > div > div:nth-child(2) > h3","attribute":"title"}}}', '{}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- ciqi: 瓷器 (https://hdchina.org/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'ciqi', '瓷器', 'https://hdchina.org/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrent_list tr:has(\"td.t_cat\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title":{"selector":"a[href*=\"details.php?id=\"]","attribute":"title"},"description":{"selector":"table.tbname tr > td:nth-child(2) > h4"},"labels":{"selector":"table.tbname tr > td:nth-child(2) > h4 > span"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?hash=\"]","attribute":"href"},"size":{"selector":"td.t_size"},"grabs":{"selector":"td.t_completed"},"seeders":{"selector":"td.t_torrents"},"leechers":{"selector":"td.t_leech"},"date_elapsed":{"selector":"td.t_time > span"},"date_added":{"selector":"td.t_time > span","attribute":"title"},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"img.pro_free,img.pro_free2up","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"csrf":{"selector":"meta[name=\"x-csrf\"]","attribute":"content"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}}}}', '{"movie":[{"id":20,"cat":"Movies/BluRay","desc":"Movie Full BD"},{"id":17,"cat":"Movies/HD","desc":"Movie 1080p"},{"id":16,"cat":"Movies/HD","desc":"Movie 1080i"},{"id":9,"cat":"Movies/HD","desc":"Movie 720p"},{"id":27,"cat":"Movies/SD","desc":"iPad Video"},{"id":410,"cat":"Movies/UHD","desc":"4K UltraHD"}],"tv":[{"id":13,"cat":"TV","desc":"EU/US TV series"},{"id":25,"cat":"TV","desc":"Chinese TV series"},{"id":26,"cat":"TV","desc":"Kor Drama"},{"id":24,"cat":"TV","desc":"Jpn Drama"},{"id":21,"cat":"TV","desc":"EU/US TV series pack"},{"id":22,"cat":"TV","desc":"Chinese TV series pack"},{"id":23,"cat":"TV","desc":"JPN/KOR drama pack"},{"id":5,"cat":"TV/Documentary","desc":"Documentary"},{"id":14,"cat":"TV/Anime","desc":"Animation"},{"id":401,"cat":"TV","desc":"TV Shows"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- coffee: 咖啡 (https://ptcafe.club)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'coffee', '咖啡', 'https://ptcafe.club', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td.embedded","remove":"span,a,img,font,b"},"labels":{"selector":"td.embedded > span[style]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- dajiao: 打胶 (https://dajiao.cyou/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'dajiao', '打胶', 'https://dajiao.cyou/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- exoticaz: exoticaz (https://exoticaz.to/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'exoticaz', 'exoticaz', 'https://exoticaz.to/', '{"paths":[{"path":"torrents","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"div.card.mt-2 > div.card-body.p-2 > div.table-responsive > table > tbody > tr:has(i)"},"fields":{"id":{"selector":"a[href^=\"https://exoticaz.to/torrent/\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"/torrent/\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"/torrent/\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"td:nth-child(1) > i.fa.fa-video.category-icon[title]","attribute":"title"},"details":{"selector":"a[href^=\"https://exoticaz.to/torrent/\"]","attribute":"href","filters":[{"name":"replace","args":["https://exoticaz.to/",""]}]},"download":{"selector":"a[href^=\"https://exoticaz.to/download/torrent/\"]","attribute":"href"},"date":{"text":"td:nth-child(4)","filters":[{"name":"date_en_elapsed_parse"}]},"size":{"selector":"td:nth-child(5)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"i.fa.fa-star.text-yellow":0,"i.fa.fa-star-half-alt.text-pink":0.5,"*":1}},"uploadvolumefactor":{"case":{"i.fa.fa-gem.text-green":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f"},"minimumratio":{"text":1},"minimumseedtime":{"text":2073600}}}', '{"movie":[{"id":"Video Clip","cat":"AV/Video Clip","desc":"Video Clip"},{"id":"Video Pack","cat":"AV/Video Pack","desc":"Video Pack"},{"id":"Siterip Pack","cat":"AV/cate_level2_desc","desc":"Siterip Pack"},{"id":"Pornstar Pack","cat":"AV/Pornstar Pack","desc":"Pornstar Pack"},{"id":"DVD","cat":"AV/DVD","desc":"DVD"},{"id":"BluRay","cat":"AV/BluRay","desc":"BluRay"},{"id":"Photo Pack","cat":"AV/Photo Pack","desc":"Photo Pack"},{"id":"Books &amp; Magazines","cat":"AV/Books","desc":"Books &amp; Magazines"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- feitianlamian: 飞天拉面 (https://fsm.name/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'feitianlamian', '飞天拉面', 'https://fsm.name/', '{"paths":[{"path":"Torrents","method":"get"}],"params":{"keyword":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"div.table-responsive > table.table-bordered > tbody > tr"},"fields":{"id":{"selector":"a[href*=\"details?tid=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"td:nth-child(3) > div> a"},"title_optional":{"optional":true,"selector":"td:nth-child(3) > div> a","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''][0:80] }}{% else %}{{ fields[''title_default''][0:80] }}{% endif %}"},"details":{"selector":"a[href*=\"details?tid=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download\"]","attribute":"href"},"size":{"selector":"td:nth-child(6)"},"grabs":{"selector":"td:nth-child(9)"},"seeders":{"selector":"td:nth-child(7)"},"leechers":{"selector":"td:nth-child(8)"},"date_added":{"selector":"td:nth-child(5)"},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"td[class=\"embedded\"] > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"div> a","index":-1},"labels":{"selector":"div > div.tags > a"},"minimumratio":{"text":1},"minimumseedtime":{"text":90000}}}', '{}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV,ANIME"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- haidan: 海胆之家 (https://www.haidan.video/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'haidan', '海胆之家', 'https://www.haidan.video/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"div.torrent_panel_inner > div.torrent_group"},"fields":{"id":{"selector":"a[href*=\"details.php?group_id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?group_id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?group_id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''][0:80]  }}{% else %}{{ fields[''title_default''][0:80] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"replace","args":["?",""]},{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?group_id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"imdbid":{"selector":"div.imdb_100 > a","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"date_elapsed":{"selector":"div.torrent_group > div.group_content > div.group_detail_wrap > div.group_detail > div.torrent_detail > div:nth-child(1) > div.torrent_item > div.time_col > span[title]","optional":true},"date_added":{"selector":"div.torrent_group > div.group_content > div.group_detail_wrap > div.group_detail > div.torrent_detail > div:nth-child(1) > div.torrent_item > div.time_col > span[title]","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"div.torrent_group > div.group_content > div.group_detail_wrap > div.group_detail > div.torrent_detail > div:nth-child(1) > div.torrent_item > div.video_size"},"seeders":{"selector":"div.torrent_group > div.group_content > div.group > div.seeder_col"},"leechers":{"selector":"div.torrent_group > div.group_content > div.group > div.leecher_col"},"grabs":{"selector":"div.torrent_group > div.group_content > div.group > div.snatched_col"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"img.pro_free,img.pro_free2up","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"div.torrent_group > div.group_content > div.group > div.table_cell > div.name > div.video_name > a","remove":"a,b,img,span","contents":-1},"labels":{"selector":"div.torrent_group > div.group_content > div.group > div.table_cell > div.name > div.video_name_extra > div"},"minimumratio":{"text":1},"minimumseedtime":{"text":90000}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"电影"}],"tv":[{"id":402,"cat":"TV/Series","desc":"电视剧"},{"id":403,"cat":"TV/Shows","desc":"综艺"},{"id":404,"cat":"TV/Documentaries","desc":"纪录片"},{"id":405,"cat":"TV/Animations","desc":"动漫"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- hdvbits: hdvbits (https://hdvbits.com/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'hdvbits', 'hdvbits', 'https://hdvbits.com/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"replace","args":["?",""]},{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"imdbid":{"selector":"div.imdb_100 > a","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"date_elapsed":{"selector":"td:nth-child(4) > span","optional":true},"date_added":{"selector":"td:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"td:nth-child(5)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"img.pro_free,img.pro_free2up","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"table.torrentname > tr > td:nth-child(1)","remove":"a,b,img,span,font,span","contents":-1},"labels":{"selector":"table.torrentname > tr > td:nth-child(1) > span"},"minimumratio":{"text":1},"minimumseedtime":{"text":90000}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"电影"}],"tv":[{"id":402,"cat":"TV/Series","desc":"电视剧"},{"id":403,"cat":"TV/Shows","desc":"综艺"},{"id":404,"cat":"TV/Documentaries","desc":"纪录片"},{"id":405,"cat":"TV/Animations","desc":"动漫"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- kufei: 库非 (https://kufei.org)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'kufei', '库非', 'https://kufei.org', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":""}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2) > span"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies(电影)","default":true}],"tv":[{"id":402,"cat":"TV","desc":"TV Series(电视剧)","default":true},{"id":403,"cat":"TV","desc":"TV Shows(综艺)","default":true},{"id":404,"cat":"TV/Documentary","desc":"Documentaries(纪录片)","default":true},{"id":405,"cat":"TV/Anime","desc":"Animations(动画)","default":true}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- mingjiao: 明教 (https://hdpt.xyz/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'mingjiao', '明教', 'https://hdpt.xyz/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div[style] > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2) > span"}}}', '{}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- mteam-kpinfo: 馒头 (https://kp.m-team.info/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'mteam-kpinfo', '馒头', 'https://kp.m-team.info/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"] > b"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"poster":{"selector":"img[alt=\"torrent thumbnail\"]","attribute":"src","filters":[{"name":"replace","args":["pic/nopic.jpg",""]}]},"imdbid":{"selector":"a[href*=\"imdb.com/title/tt\"]","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"size":{"selector":"td.rowfollow:nth-last-child(6)"},"grabs":{"selector":"td.rowfollow:nth-last-child(3)"},"seeders":{"selector":"td.rowfollow:nth-last-child(5)"},"leechers":{"selector":"td.rowfollow:nth-last-child(4)"},"date_added":{"selector":"td.rowfollow:nth-last-child(7) > span","attribute":"title","optional":true},"date_elapsed":{"selector":"tr > td > span","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"span[style=\"font-weight:normal\"]","filters":[{"name":"re_search","args":["(?:限時：\\s*)((?:\\d+日)?(?:\\d+時)?(?:\\d+分)?)",1]},{"name":"date_elapsed_parse"}]},"description":{"selector":"table.torrentname > tr > td.embedded","contents":-1},"labels":{"selector":"table.torrentname > tr > td.embedded > img[class*=\"label_\"]","attribute":"alt"}}}', '{"movie":[{"id":401,"cat":"Movies/SD","desc":"Movie(電影)/SD","default":true},{"id":419,"cat":"Movies/HD","desc":"Movie(電影)/HD","default":true},{"id":420,"cat":"Movies/DVD","desc":"Movie(電影)/DVDiSo","default":true},{"id":421,"cat":"Movies/BluRay","desc":"Movie(電影)/Blu-Ray","default":true},{"id":439,"cat":"Movies/Other","desc":"Movie(電影)/Remux","default":true}],"tv":[{"id":403,"cat":"TV/SD","desc":"TV Series(影劇/綜藝)/SD","default":true},{"id":402,"cat":"TV/HD","desc":"TV Series(影劇/綜藝)/HD","default":true},{"id":435,"cat":"TV/SD","desc":"TV Series(影劇/綜藝)/DVDiSo","default":true},{"id":438,"cat":"TV/HD","desc":"TV Series(影劇/綜藝)/BD","default":true},{"id":404,"cat":"TV/Documentary","desc":"紀錄教育","default":true},{"id":405,"cat":"TV/Anime","desc":"Anime(動畫)","default":true}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- mteam-xpcc: 馒头(Porn) (https://xp.m-team.cc/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'mteam-xpcc', '馒头(Porn)', 'https://xp.m-team.cc/', '{"paths":[{"path":"adult.php","method":"get"}],"params":{"search":"{keyword}"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"] > b"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"poster":{"selector":"img[alt=\"torrent thumbnail\"]","attribute":"src","filters":[{"name":"replace","args":["pic/nopic.jpg",""]}]},"imdbid":{"selector":"a[href*=\"imdb.com/title/tt\"]","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"size":{"selector":"td.rowfollow:nth-last-child(6)"},"grabs":{"selector":"td.rowfollow:nth-last-child(3)"},"seeders":{"selector":"td.rowfollow:nth-last-child(5)"},"leechers":{"selector":"td.rowfollow:nth-last-child(4)"},"date_added":{"selector":"td.rowfollow:nth-last-child(7) > span","attribute":"title","optional":true},"date_elapsed":{"selector":"tr > td > span","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"span[style=\"font-weight:normal\"]","filters":[{"name":"re_search","args":["(?:限時：\\s*)((?:\\d+日)?(?:\\d+時)?(?:\\d+分)?)",1]},{"name":"date_elapsed_parse"}]},"description":{"selector":"table.torrentname > tr > td.embedded","contents":-1},"labels":{"selector":"table.torrentname > tr > td.embedded > img[class*=\"label_\"]","attribute":"alt"}}}', '{"adult":[{"id":410,"cat":"Adults/HD-Censored","desc":"高清(有碼)/HD-Censored","default":true},{"id":429,"cat":"Adults/HD-Uncensored","desc":"高清(無碼)/HD-Uncensored","default":true},{"id":424,"cat":"Adults/SD-Censored","desc":"標清(有碼)/SD-Censored","default":true},{"id":430,"cat":"Adults/SD-Uncensored","desc":"標清(無碼)/SD-Uncensored","default":true},{"id":431,"cat":"Adults/SD-Censored","desc":"藍光(有碼)/UHD-Censored","default":true},{"id":432,"cat":"Adults/SD-Uncensored","desc":"藍光(無碼)/UHD-Uncensored","default":true}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"ADULT","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- mteam-xpio: 馒头(XPIO) (https://xp.m-team.io/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'mteam-xpio', '馒头(XPIO)', 'https://xp.m-team.io/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"] > b"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"poster":{"selector":"img[alt=\"torrent thumbnail\"]","attribute":"src","filters":[{"name":"replace","args":["pic/nopic.jpg",""]}]},"imdbid":{"selector":"a[href*=\"imdb.com/title/tt\"]","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"size":{"selector":"td.rowfollow:nth-last-child(6)"},"grabs":{"selector":"td.rowfollow:nth-last-child(3)"},"seeders":{"selector":"td.rowfollow:nth-last-child(5)"},"leechers":{"selector":"td.rowfollow:nth-last-child(4)"},"date_added":{"selector":"td.rowfollow:nth-last-child(7) > span","attribute":"title","optional":true},"date_elapsed":{"selector":"tr > td > span","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"span[style=\"font-weight:normal\"]","filters":[{"name":"re_search","args":["(?:限時：\\s*)((?:\\d+日)?(?:\\d+時)?(?:\\d+分)?)",1]},{"name":"date_elapsed_parse"}]},"description":{"selector":"table.torrentname > tr > td.embedded","contents":-1},"labels":{"selector":"table.torrentname > tr > td.embedded > img[class*=\"label_\"]","attribute":"alt"}}}', '{"movie":[{"id":401,"cat":"Movies/SD","desc":"Movie(電影)/SD","default":true},{"id":419,"cat":"Movies/HD","desc":"Movie(電影)/HD","default":true},{"id":420,"cat":"Movies/DVD","desc":"Movie(電影)/DVDiSo","default":true},{"id":421,"cat":"Movies/BluRay","desc":"Movie(電影)/Blu-Ray","default":true},{"id":439,"cat":"Movies/Other","desc":"Movie(電影)/Remux","default":true}],"tv":[{"id":403,"cat":"TV/SD","desc":"TV Series(影劇/綜藝)/SD","default":true},{"id":402,"cat":"TV/HD","desc":"TV Series(影劇/綜藝)/HD","default":true},{"id":435,"cat":"TV/SD","desc":"TV Series(影劇/綜藝)/DVDiSo","default":true},{"id":438,"cat":"TV/HD","desc":"TV Series(影劇/綜藝)/BD","default":true},{"id":404,"cat":"TV/Documentary","desc":"紀錄教育","default":true},{"id":405,"cat":"TV/Anime","desc":"Anime(動畫)","default":true}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- ptvicomo: ptvicomo (https://ptvicomo.net/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'ptvicomo', 'ptvicomo', 'https://ptvicomo.net/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- queen: 皇后 (https://open.cd/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'queen', '皇后', 'https://open.cd/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(10)"},"seeders":{"selector":"td:nth-child(8)"},"leechers":{"selector":"td:nth-child(9)"},"date_elapsed":{"selector":"td:nth-child(6) > span","optional":true},"date_added":{"selector":"td:nth-child(6) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"td[class=\"embedded\"] > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"description":{"selector":"table.torrentname > tr > td.embedded > font","index":-1},"labels":{"selector":"table.torrentname > tr > td.embedded > i > a"}}}', '{}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- rousi: 肉丝 (https://rousi.zip/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'rousi', '肉丝', 'https://rousi.zip/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}","allsec":true},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"replace","args":["?",""]},{"name":"querystring","args":"cat"}]},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"imdbid":{"selector":"div.imdb_100 > a","attribute":"href","filters":[{"name":"re_search","args":["tt\\d+",0]}]},"date_elapsed":{"selector":"td:nth-child(4) > span","optional":true},"date_added":{"selector":"td:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"td:nth-child(5)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"img.pro_free,img.pro_free2up","attribute":"onmouseover","filters":[{"name":"re_search","args":["\\d+-\\d+-\\d+ \\d+:\\d+:\\d+",0]},{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(2) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies(电影)","desc":"Movies(电影)"},{"id":406,"cat":"Music(音乐、专辑、MV、演唱会)","desc":"Music(音乐、专辑、MV、演唱会)"},{"id":422,"cat":"III(三级片、限制级电影)","desc":"III(三级片、限制级电影)"},{"id":423,"cat":"H漫(动漫、漫画)","desc":"H漫(动漫、漫画)"},{"id":426,"cat":"H图(写真、图片、私拍、短视频)","desc":"H图(写真、图片、私拍、短视频)"}],"tv":[{"id":402,"cat":"TV Series(电视剧)","desc":"Doc SD"},{"id":403,"cat":"TV Shows(综艺)","desc":"TV Shows(综艺)"},{"id":404,"cat":"Documentaries(纪录片)","desc":"Documentaries(纪录片)"},{"id":405,"cat":"Animations(3D动画、2.5次元)","desc":"Animations(3D动画、2.5次元)"},{"id":407,"cat":"Sports(体育、竞技、武术及相关)","desc":"Sports(体育、竞技、武术及相关)"},{"id":419,"cat":"Art(舞蹈、歌剧、戏曲、相声、评书等)","desc":"Art(舞蹈、歌剧、戏曲、相声、评书等)"},{"id":415,"cat":"ACGN(二次元、漫画、动漫)","desc":"ACGN(二次元、漫画、动漫)"},{"id":416,"cat":"Baby(婴幼、儿童、早教、小学及相关)","desc":"Baby(婴幼、儿童、早教、小学及相关)"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- skyey2: 天雪(skyey2) (https://www.skyey2.com/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'skyey2', '天雪(skyey2)', 'https://www.skyey2.com/', '{"paths":[{"path":"forum.php?mod=torrents&cat=1&search={keyword}","method":"get"}]}', '', 0, '{"list":{"selector":"table.torrents > tbody > tr:has(\"td.rowfollow\")"},"fields":{"id":{"selector":"a[href*=\"/download.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title":{"selector":"table.torrentname > tbody > tr > td > a[title]","attribute":"title"},"details":{"selector":"table.torrentname > tbody > tr > td > a[title]","attribute":"href"},"download":{"selector":"a[href*=\"/download.php?id=\"]","attribute":"href"},"date_added":{"selector":"td:nth-child(3)"},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"size":{"selector":"td:nth-child(4)"},"seeders":{"selector":"td:nth-child(7)"},"leechers":{"selector":"td:nth-child(6)"},"grabs":{"selector":"td:nth-child(5)"},"downloadvolumefactor":{"case":{"img.sp_4":0,"*":1}},"uploadvolumefactor":{"case":{"*":1}}}}', '{}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8","browse":{"path":"forum.php?mod=torrents&page={page}"}}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- startspace: 星空 (https://star-space.net/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'startspace', '星空', 'https://star-space.net/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- u9a9: u9a9 (https://u9a9.de/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'u9a9', 'u9a9', 'https://u9a9.de/', '{"paths":[{"path":"?type=2&search={keyword}","method":"get"}]}', '', 1, '{"list":{"selector":"table.torrent-list > tbody > tr"},"fields":{"id":{"selector":"a[href*=\"/view/2/\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"title":{"selector":"td:nth-child(2) > a"},"details":{"selector":"td:nth-child(2) > a","attribute":"href"},"download":{"selector":"td:nth-child(3) > a[href*=\"magnet:\"]","attribute":"href"},"date_added":{"selector":"td:nth-child(5)"},"size":{"selector":"td:nth-child(4)"},"seeders":{"selector":"td:nth-child(6)"},"leechers":{"selector":"td:nth-child(7)"},"grabs":{"selector":"td:nth-child(8)"},"downloadvolumefactor":{"case":{"*":0}},"uploadvolumefactor":{"case":{"*":1}}}}', '{}', '{"render":false,"proxy":true,"en_expand":false,"source_type":"MOVIE,TV,ANIME","encoding":"UTF-8","browse":{"path":"?type=2&p={page}","start":1}}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- xingtan: 杏坛 (https://xingtan.one/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'xingtan', '杏坛', 'https://xingtan.one/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1) > span"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;

-- ying: 影 (https://shadowflow.org/)
INSERT INTO INDEXER_SITES (
    ID, NAME, DOMAIN, SEARCH, PARSER, PUBLIC, TORRENTS, CATEGORY, EXTRA
) VALUES (
    'ying', '影', 'https://shadowflow.org/', '{"paths":[{"path":"torrents.php","method":"get"}],"params":{"search":"{keyword}"},"batch":{"delimiter":" ","space_replace":"_"}}', '', 0, '{"list":{"selector":"table.torrents > tr:has(\"table.torrentname\")"},"fields":{"id":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href","filters":[{"name":"re_search","args":["\\d+",0]}]},"category":{"selector":"a[href*=\"?cat=\"]","attribute":"href","filters":[{"name":"querystring","args":"cat"}]},"title_default":{"selector":"a[href*=\"details.php?id=\"]"},"title_optional":{"optional":true,"selector":"a[title][href*=\"details.php?id=\"]","attribute":"title"},"title":{"text":"{% if fields[''title_optional''] %}{{ fields[''title_optional''] }}{% else %}{{ fields[''title_default''] }}{% endif %}"},"details":{"selector":"a[href*=\"details.php?id=\"]","attribute":"href"},"poster":{"selector":"img[data-orig]","attribute":"data-orig"},"download":{"selector":"a[href*=\"download.php?id=\"]","attribute":"href"},"size":{"selector":"td.rowfollow:nth-child(5)"},"grabs":{"selector":"td.rowfollow:nth-child(8)"},"seeders":{"selector":"td.rowfollow:nth-child(6)"},"leechers":{"selector":"td.rowfollow:nth-child(7)"},"date_elapsed":{"selector":"td.rowfollow:nth-child(4) > span","optional":true},"date_added":{"selector":"td.rowfollow:nth-child(4) > span","attribute":"title","optional":true},"date":{"text":"{% if fields[''date_elapsed''] or fields[''date_added''] %}{{ fields[''date_elapsed''] if fields[''date_elapsed''] else fields[''date_added''] }}{% else %}now{% endif %}","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"downloadvolumefactor":{"case":{"img.pro_free":0,"img.pro_free2up":0,"img.pro_50pctdown":0.5,"img.pro_50pctdown2up":0.5,"img.pro_30pctdown":0.3,"*":1}},"uploadvolumefactor":{"case":{"img.pro_50pctdown2up":2,"img.pro_free2up":2,"img.pro_2up":2,"*":1}},"free_deadline":{"default_value":"{% if fields[''downloadvolumefactor'']==0 %}{{max_time}}{% endif%}","default_value_format":"%Y-%m-%d %H:%M:%S.%f","selector":"div > b > span[title]","attribute":"title","filters":[{"name":"dateparse","args":"%Y-%m-%d %H:%M:%S"}]},"tags":{"selector":"div > a.torrents-tag"},"subject":{"selector":"td.embedded:nth-child(2) > div > div:nth-child(2) > span","contents":-1},"description":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1)","remove":"span,a,img,font,b","contents":-1},"labels":{"selector":"td:nth-child(2) > table.torrentname > tr > td:nth-child(1) > span[title=\"\"]"}}}', '{"movie":[{"id":401,"cat":"Movies","desc":"Movies/电影"}],"tv":[{"id":404,"cat":"TV/Documentary","desc":"Documentaries/纪录片"},{"id":405,"cat":"TV/Anime","desc":"Animations/动漫"},{"id":402,"cat":"TV","desc":"TV Series/连续剧"},{"id":403,"cat":"TV","desc":"TV Shows/综艺"}]}', '{"render":false,"proxy":false,"en_expand":false,"source_type":"MOVIE,TV","encoding":"UTF-8"}'
)
ON CONFLICT(ID) DO UPDATE SET
    NAME = excluded.NAME,
    DOMAIN = excluded.DOMAIN,
    SEARCH = excluded.SEARCH,
    PARSER = excluded.PARSER,
    PUBLIC = excluded.PUBLIC,
    TORRENTS = excluded.TORRENTS,
    CATEGORY = excluded.CATEGORY,
    EXTRA = excluded.EXTRA;
