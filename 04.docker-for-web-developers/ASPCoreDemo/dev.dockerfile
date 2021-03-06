FROM        mcr.microsoft.com/dotnet/core/sdk

LABEL       author="Trong Hieu"

ENV         ASPNETCORE_URLS=http://*:5000
ENV         DOTNET_USE_POLLING_FILE_WATCHER=1
ENV         ASPNETCORE_ENVIRONMENT=development

WORKDIR     /app

ENTRYPOINT  [ "/bin/bash", "-c", "dotnet restore && dotnet watch run" ]

# Build the image using:
# docker build -t [image_name]

# Run the image using:
# docker run -p 8080:5000 -v $(pwd):/app [image_name]
