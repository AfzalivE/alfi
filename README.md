# alfi 2

![](http://ruby-gem-downloads-badge.herokuapp.com/alfi2?type=total)
[![Build Status](https://travis-ci.org/AfzalivE/alfi.svg?branch=master)](https://travis-ci.org/AfzalivE/alfi) 
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/52ccd1e232684026b943c2be7059afcd)](https://www.codacy.com/app/AfzalivE/alfi?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=AfzalivE/alfi&amp;utm_campaign=Badge_Grade)
[![Gem Version](http://img.shields.io/gem/v/alfi2.svg?style=flat)](http://badge.fury.io/rb/alfi2) 

**A**ndroid **L**ibrary **Fi**nder 2

Search through thousands of android libraries that can help you scale your projects elegantly

## Installation

Install it via terminal:

    $ gem install alfi2

## Usage

Search for `something`

```bash
alfi picasso
```

<p align="center">
<img src="https://raw.github.com/cesarferreira/alfi/master/extras/images/terminal01.gif" />
</p>


Search for `something` by repository

```bash
alfi picasso --repository maven
```

This will search picasso only on maven, you can also define multiple repositories like:

```bash
alfi picasso -r mavencentral -r jcenter
```

This will search picasso on mavenCentral and jCenter

Search for `something` and print with a custom prefix

```bash
alfi picasso -p compile
```

Search for `something` and print with single quotes

```bash
alfi picasso -s
```

**Final step:** Copy the library you want to your `build.gradle` and sync it

## Contributing

1. Fork it ( https://github.com/afzalive/alfi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Thanks
To [@cesarferreira](https://github.com/cesarferreira) for creating this project

To [@joaquimadraz](https://github.com/joaquimadraz) for the ruby pro-tips
