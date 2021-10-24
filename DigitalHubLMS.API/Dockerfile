#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["DigitalHubLMS.API/DigitalHubLMS.API.csproj", "DigitalHubLMS.API/"]
COPY ["DigitalHubLMS.Core/DigitalHubLMS.Core.csproj", "DigitalHubLMS.Core/"]
COPY ["MZCore/MZCore.csproj", "MZCore/"]
RUN dotnet restore "DigitalHubLMS.API/DigitalHubLMS.API.csproj"
COPY . .
WORKDIR "/src/DigitalHubLMS.API"
RUN dotnet build "DigitalHubLMS.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DigitalHubLMS.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DigitalHubLMS.API.dll"]
