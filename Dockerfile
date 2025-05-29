FROM node:18

WORKDIR /app

RUN git clone https://github.com/gitroomhq/postiz . 

ENV NEXT_PUBLIC_BACKEND_URL=https://postiz.apps.maformationenvisio.com/api
ENV MAIN_URL=https://postiz.apps.maformationenvisio.com
ENV FRONTEND_URL=https://postiz.apps.maformationenvisio.com
ENV JWT_SECRET=un_secret_fort
ENV BACKEND_INTERNAL_URL=http://localhost:3000
ENV IS_GENERAL=true
ENV DATABASE_URL=postgresql://postiz-user:postiz-password@postiz-postgres:5432/postiz-db-local
ENV REDIS_URL=redis://postiz-redis:6379
ENV STORAGE_PROVIDER=local
ENV UPLOAD_DIRECTORY=/uploads
ENV NEXT_PUBLIC_UPLOAD_DIRECTORY=/uploads

RUN yarn install && yarn build

CMD ["caddy", "run", "--config", "Caddyfile"]
