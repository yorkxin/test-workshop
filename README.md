# Introduction to Rails Testing Workshop

This repository hosts materials of Rails testing workshop.

It's very draftly and only includes very basic usages of RSpec testing. It may be improved in the future. If you have any idea feel free to open an issue.

Also, you're free to use this material. You don't have to ask me anything to use this material. It'll be nice if you drop a note to me (twitter @yorkxin) if you have used this. Any feedback is welcomed.

## How to use

The repository contains several tags that help attendees switch to a revision quickly:

* `rev-*` - for examples, features are done, and may have some sample tests
* `exercise-*` - for exercises
* `answer-*` - for answers to corresponding exercises

To run the workshop:

1. Ask attendees to `git checkout rev-01`
* Explain some code in this version
* Ask attendees to `git checkout -f exercise-01`
* Ask attendees to fill some code
* Ask attendees to `git checkout -f answer-01` (their works will be overriden).
* Continue to 1 for next loop.

## Slides

The slides I used during Rails Pacific 2014 is here: [Rails Testing Workshop // Speaker Deck](https://speakerdeck.com/chitsaou/rails-testing-workshop)

## Things to improve

This workshop is not good enough, and needs many improvements. Here are some of them I thought of:

* Make it possible for attendees to save their works
  * This includes the problem on how to apply new sample (app) code
  * It can't work like RailsBridge since the only things they do are tests
* Don't teach "stub" for beginners
* Don't teach "subject" for beginners
* Don't teach shared context / shared examples for beginners
* More exercises
* More material references

Got any idea? Open a new [issue](https://github.com/chitsaou/test-workshop/issues)!

## License

You can use this material for any purpose without my permission. However, to avoid legal issues, I still have to claim license agreement here. But remember, **it's yours, take it**.

### Source Code

MIT Licence. See LICENSE file.

### 3rd-Party Gems

In order to avoid network failure during workshop, all gems are packaged into `vendor/cache` and will be distributed during `git clone`.

If you think it is not good to distribute any of them (license issue etc.), please kindly open an issue, and I'll remove them.

Also, tell me if you have good idea about network issue!
