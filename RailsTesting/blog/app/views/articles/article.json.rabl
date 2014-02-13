attributes :id, :title, :content

node(:url) { |article| edit_article_path(article) }
node(:title) { |article| article.title + ' chido' }
