## Apigee token Github action
This action gets a token from apigee so you can use acquired to deploy apigee resources.

You need to provide two environment variables. `APIGEE_USER` and `APIGEE_PASSWORD`

### Examples

```yaml
 apigee:
    runs-on: ubuntu-latest
    steps:
      - name: Get apigee token
        id: apigeetoken
        env:
          APIGEE_USER: ${{ secrets.APIGEE_USER }}
          APIGEE_PASSWORD: '${{ secrets.APIGEE_PASSWORD }}'
        uses: artronics/apigee-token-action@master

      - name: Do something with token
        run: my-provisioner ${{ steps.apigeetoken.outputs.token }}
```
