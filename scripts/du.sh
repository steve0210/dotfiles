du -sh \
  $(find ~/workspace -maxdepth 3 -type d -name node_modules) \
  $(find ~/Library/Caches -maxdepth 1 -type d -name Yarn) \
  ~/.rvm \
  ~/.nvm

