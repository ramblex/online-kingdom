var newsOptions = '<span id="news-category">Choose your news category: <?php foreach($categories as $category): ?> <a href="<?php echo '?category='.$category->id.'">'.$category->name ?></a> <?php endforeach ?>';
var links = $('#news');
$links.before(newsOptions);
