### Release Steps

update version in CircleButton.podspec  
update the git tag to match the new version  
update README.md  

    pod lib lint

    git add -A && git commit -m "Release 1.0.0."
    git tag '1.0.0'
    git push --tags

    pod trunk push  CircleButton.podspec

