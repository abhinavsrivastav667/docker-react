FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
 # After copying our source code we can run npm run build #the output is our build folder
# build folder will be created in our working directory

#the folder that we really care about which has got all the asset is /app/builder
#that is the folder that eventually we want to copy over during the run phase

#Now we will write configuration for our second phase that is RUN PHASE

FROM nginx
EXPOSE 80  # this will expose the port 80 
COPY --from=builder /app/build /usr/share/nginx/html
