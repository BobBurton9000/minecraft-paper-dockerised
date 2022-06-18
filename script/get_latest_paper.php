<?php

var_dump(getenv('VERSION'));

const PAPER_MC_API = 'https://papermc.io/api/v2/projects/paper/versions';

$version = getenv('VERSION');

if($version == '') {
    throw new \exception("No version found");
}

$buildRequest = json_decode(file_get_contents(PAPER_MC_API.'/'.$version));

$build = $buildRequest->builds[count($buildRequest->builds)-1];

$downloadRequest = json_decode(file_get_contents(PAPER_MC_API.'/'.$version.'/builds/'.$build));

var_dump($downloadRequest);

$download_url = PAPER_MC_API.'/'.$version.'/builds/'.$build.'/downloads/'.$downloadRequest->downloads->application->name;

exec('wget '.$download_url.' -O paper-server.jar');