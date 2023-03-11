# Start pagefind locally
hugo
npm_config_yes=true npx pagefind --source "public" --bundle-dir ../static/mysearch
hugo server
