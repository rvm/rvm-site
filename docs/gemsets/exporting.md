---
title: "Exporting gemsets"
---

## Managing gemsets

You can not only use completely separate gemsets per application/project/etc... you can also export and load them very easily, too.

To export a gemset, assuming a project called 'teddy' running on Ruby 2.1.1:

```
$ rvm 2.1.1@teddy do gemset export
```

creates an 'teddy.gems' file.

Alternatively, if you already have a ruby selected

```
rvm gemset export
```

creates a 'default.gems' file.

You can specify the gemset filename prefix, also

```
rvm gemset export teddy.gems
```

A subtle difference with the above command is to leave off the '.gems' which will export the gems for the gemset named 'mygemsetname'
/ unclear what happens here. if the example used 'rosie', I'd interpret this as "although gem set teddy is currently in use, this command will export the not-in-use gem set 'rosie', perhaps to the export file 'rosie.gems'"

```
rvm gemset export teddy
```
