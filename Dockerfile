FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["dockerresearch.csproj", "dockerresearch.csproj"]
RUN dotnet restore "dockerresearch.csproj"
COPY . .
WORKDIR /src
RUN dotnet build "dockerresearch.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "dockerresearch.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "dockerresearch.dll"]