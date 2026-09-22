FROM node:22.9-alpine3.20

RUN apk add --no-cache python3 g++ make

WORKDIR /opt/TediCross/

COPY . .

RUN npm install --omit=dev

EENTRYPOINT ["/bin/sh", "-c"]
CMD ["if [ ! -f /opt/TediCross/data/settings.yaml ]; then cp /opt/TediCross/settings.template.yaml /opt/TediCross/data/settings.yaml; fi; sed -i 's/suppressThisIsPrivateBotMessage: false/suppressThisIsPrivateBotMessage: true/' /opt/TediCross/data/settings.yaml; exec npm start -- -c data/settings.yaml"]
