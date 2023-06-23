# Jekyll::Autolinks

Automatically create `<a>` DOMs from standard URLs for your Jekyll site.

In any html page or post, standard URLs and emails will be autolinked.

- `https://github.com/` => `<a href="https://github.com/">https://github.com/</a>`.
- `hi@gmail.com` => `<a href="mailto:hi@gmail.com">hi@gmail.com</a>`.

Modified based on [ivantsepp/jekyll-autolink_email](https://github.com/ivantsepp/jekyll-autolink_email).

## Installation

1. Add to your `Gemfile`:

    ```
    gem 'jekyll-autolinks'
    ```

2. Add to your `_config.yml`:

    ```yml
    gems:
      - jekyll-autolinks
    ```

## Configuration

Autolinking is done by [Rinku](https://github.com/vmg/rinku) so visit that gem for a more in-depth explanation of the configuration options:

```yml
autolinks:
  link_attr: 'target="_blank"'
  skip_tags: ["a", "pre", "code", "kbd", "script"]
```

- `link_attr` is a string containing the link attributes for each link that will be generated. These attributes are not sanitized and will be include as-is in each generated link, e.g.

    ```
    link_attr: 'target="_blank" class="my-link"'
    # hi.com => '<a href="http://hi.com" target="_blank" class="my-link">hi.com</a>'
    ```

- `skip_tags` is a list of strings with the names of HTML tags that will be skipped when autolinking. If nil, this defaults to the value of the global Rinku.skip_tags, which is initially `["a", "pre", "code", "kbd", "script"]`.

## Suggestion, Bug Reporting, Contributing

**Before opening new Issue/Discussion/PR and posting any comments**, please read [Contributing Guidelines](https://gcg.adoyle.me/CONTRIBUTING).

## Copyright and License

Copyright 2023 ADoyle (adoyle.h@gmail.com). Some Rights Reserved.
The project is licensed under the **BSD 3-clause License**.

Read the [LICENSE][] file for the specific language governing permissions and limitations under the License.

Read the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
