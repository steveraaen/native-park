# native-park
$ brew update
$ brew install ruby-build
$ brew install rbenv

$ rbenv install 2.7.5
$ rbenv global 2.7.5
After that, you need to export some configurations to define rbenv as default global ruby. For zsh users:

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
And restart the terminal or run source ~/.zshrc.

Discussion: https://stackoverflow.com/questions/74189532/your-ruby-version-is-2-6-8-but-your-gemfile-specified-2-7-5

to initialize new project
npx react-native@latest init <projectName> --version 0.71.0
cd <projectName>
npx react-native-macos-init