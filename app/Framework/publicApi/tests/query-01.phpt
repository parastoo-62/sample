--TEST--
core.get_author_index with permalink enabled..
--FILE--
<?php

require_once '../../../../../testLoad.php';
$http = new HTTP_Client();
$http->get('http://localhost/MVC/api/get_author_index/?dev=1');
$response = $http->currentResponse();
$response = json_decode($response['body']);
$author = $response->authors[0];

echo "Response status: $response->status\n";
echo "Author count: $response->count\n";
echo "Author name: $author->name\n";

?>
--EXPECT--
Response status: ok
Author count: 1
Author name: themedemos
