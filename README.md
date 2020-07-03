## Apigee token Github action
This action gets a token from apigee so, you can use acquired to deploy apigee resources.

You need to provide two environment variables. `APIGEE_USER` and `APIGEE_PASSWORD`

The output (`token`) will be masked.

### Examples

This example builds the container each time you run your pipeline.
```yaml
 apigee:
    runs-on: ubuntu-latest
    steps:
      - name: Get apigee token
        id: apigeetoken
        env:
          APIGEE_USER: ${{ secrets.APIGEE_USER }}
          # use single quote just in case if password contains special characters
          APIGEE_PASSWORD: '${{ secrets.APIGEE_PASSWORD }}'
        uses: artronics/apigee-token-action@master

      - name: Do something with token
        run: my-provisioner ${{ steps.apigeetoken.outputs.token }}
```

You can also use docker image. This will prevent rebuilding the image for every run.
```yaml
  - name: Get apigee token
    id: apigeetoken
    env:
      APIGEE_PASSWORD: '${{ secrets.APIGEE_PASSWORD }}'
    uses: docker://artronics/apigee-token-action:latest
```
