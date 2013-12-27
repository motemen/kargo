# Kargo

Tiny download manager; no packages, no dependency resolving. Keep your project's dependencies just by writing `Kargofile`.

## Installation

    $ gem install kargo

## Usage

```
% cat Kargofile
components/bootstrap     git://github.com/twbs/bootstrap
components/font-awesome  zip:http://fontawesome.io/assets/font-awesome-4.0.3.zip#font-awesome-4.0.3
```

```
% kargo
download components/bootstrap (git://github.com/twbs/bootstrap)
Cloning into 'components/bootstrap'...
...
download components/font-awesome (zip:http://fontawesome.io/assets/font-awesome-4.0.3.zip#font-awesome-4.0.3)
######################################################################## 100.0%
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
