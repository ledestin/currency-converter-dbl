# Setting Up

To set things up, you need to create `.env.local` and `.env.test` with
`OXR_APP_ID` variable, set to your Open Exchange app id.

Usual Rails/Yarn setup otherwise. `./bin/setup` might help, but I haven't tested
it.

# Overview

As far as code quality goes, I feel it's fine, but there are lots of things that
can be improved.

* I usually take error handling very seriously, but have done none of it in this
    project.
* In test env, I'd like to migrate to `Bank` that is always set up for tests,
    instead of mocking as it's done now. `Bank = Rails.env.test? TestBank :
    RealBank`. I prefer it over VCR.
* For a large project, VueX might make sense, but this is a small project.
* I've used [Suspenders](https://github.com/thoughtbot/suspenders) to speed up
    project setup, but I wouldn't necessarily use it in a real-life project.
