# Install notes Azure Pipelines Agent

- Flash Raspbian lite
- Install Docker
- Install docker-compose
- Deploy `docker-compose.yml`
- Add `.env` file with the following keys:

```bash
AZP_URL=https://dev.azure.com/brewblox
AZP_TOKEN={TOKEN}
AZP_AGENT_NAME={AGENT NAME}
```
