object @article
attributes :id, :title, :content
node :user do
	'Guest' unless @current_user
end