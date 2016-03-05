# GoodAsOldPhones-Swift
This repo captures the coding I did while following along with the [App Evolution with Swift](https://www.codeschool.com/courses/app-evolution-with-swift) course from @codeschool. 

So, why start now with Swift? Well, this weekend was a Free Weekend on [Code School](https://www.codeschool.com) meaning anyone who had signed up with them could take any of their courses during a 48hr window. This is a fantastic way to 'try before you buy'. So, I took advantage and here I am, about 5 hours later reporting out on how the course went for me. Bottom line, I was able to follow along and build my very first iOS Swift app. 

The purpose of this Readme is to just highlight a few observations from takign the course. Remember, I had never created an iOS app, or coded in Swift up until I took this course. All opinions are my own. 

# Jingles matter
First thing to observe was the production quality of the course. I was particulalry chuffed to here a very nice jingle and watch a nice cinematic transtion between each level of the course. Nice touch!

# Adding images from Assets.xcassets manually
After a couple of levels, I decided to get this code checked into GitHub. It is, afterall, nice to look back and see the progression of the class from the perspective of the code I was writing. So, I created a local repo, then a remote repo and merged the two. great instructions can be foudn [here](https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/)

Every now and then I decide to validate my repo creating by nuking everything local and then clonin the repo. If the code at that point doesn't load, compile or run as expected then the chances are that I missed soem files. Lo and behold - that's exactly what happened to the images I had added to the assets catalog in my project called `Assets.xcassets`. The images never made it to my remote repo! 

Some searching on Stack overflow led me to the conclusion that this was a known issue and the workaround was simple enough - I had to `git add .` in my local folder to add all missing files and then `git push origin master` to gt those up into my remote repo - Mystery solved!

# So that's a segue

# Real Estate issues

# Commentary

# Gamification

# Acknowledgements

Many thanks to @jonfriskics for hosting this course on @codeschool. The pace was perfect and Jon's voice and communication style is great to follow along to. You can also see Jon's full (original) code on [GitHub](https://github.com/codeschool/AppEvolutionWithSwiftDemo)

Thanks also to [Code School](https://www.codeschool.com) for hosting this Free Weekend! 