FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
RUN curl https://dotnet.microsoft.com/download/dotnet-core/scripts/v1/dotnet-install.sh -o i.sh \
    && chmod +x i.sh \
    && ./i.sh \
    && ls
ENV PATH="/root/.dotnet:${PATH}"
RUN /root/.dotnet/dotnet tool install dotnet-dump --tool-path /tools \
    && /root/.dotnet/dotnet tool install dotnet-gcdump --tool-path /tools \
    && /root/.dotnet/dotnet tool install dotnet-symbol --tool-path /tools \
    && /root/.dotnet/dotnet tool install dotnet-sos --tool-path /tools \
    && /root/.dotnet/dotnet tool install dotnet-counters --tool-path /tools \
    && /root/.dotnet/dotnet tool install dotnet-trace --tool-path /tools
ENV PATH="/tools:${PATH}"
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8000
EXPOSE 8000
EXPOSE 443
