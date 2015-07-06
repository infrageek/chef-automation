# linux_acl-cookbook

Cookbook for creating application users along with their home_dir..

## Supported Platforms

Any Linux Platform

## Attributes

<table>
  <tr>
    <th>Env</th>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>Prod</tt></td>
    <td><tt>['linux_acl_prod']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>Dev</tt></td>
    <td><tt>['linux_acl_dev']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### linux_acl::default

Include `linux_acl` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[linux_acl::default]"
  ]
}
```

## License and Authors

Author:: Trijit Acharyya Chowdhury (<YOUR_EMAIL>)
