#Use CxFlow Base image
FROM checkmarx/cx-flow
#Apply any updates
RUN apk update && apk upgrade

#Test Jun 8
RUN ls
COPY checkmarx.crt /usr/local/share/ca-certificates/ca-certificates.crt
RUN apk add --no-cache ca-certificates && \
    update-ca-certificates
RUN chmod 644 /usr/local/share/ca-certificates/ca-certificates.crt && update-ca-certificates


#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
#Make it executable
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
