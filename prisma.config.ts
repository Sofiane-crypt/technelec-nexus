import 'dotenv/config'
import { defineConfig, env } from '@prisma/config'

export default defineConfig({
  // On indique où se trouve le schéma
  schema: 'prisma/schema.prisma',
  
  // On remplace "migrate" par "datasource" pour la connexion
  datasource: {
    url: env('DATABASE_URL'),
  },
})