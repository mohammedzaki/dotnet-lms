#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["DigitalHubLMS.Migrations/DigitalHubLMS.Migrations.csproj", "DigitalHubLMS.Migrations/"]
COPY ["DigitalHubLMS.Core/DigitalHubLMS.Core.csproj", "DigitalHubLMS.Core/"]
COPY ["MZCore/MZCore.csproj", "MZCore/"]
RUN dotnet restore "DigitalHubLMS.Migrations/DigitalHubLMS.Migrations.csproj"
COPY . .
WORKDIR "/src/DigitalHubLMS.Migrations"
RUN dotnet build "DigitalHubLMS.Migrations.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DigitalHubLMS.Migrations.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DigitalHubLMS.Migrations.dll"]
