#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["DigitalHubLMS.Web/DigitalHubLMS.Web.csproj", "DigitalHubLMS.Web/"]
COPY ["DigitalHubLMS.Core/DigitalHubLMS.Core.csproj", "DigitalHubLMS.Core/"]
RUN dotnet restore "DigitalHubLMS.Web/DigitalHubLMS.Web.csproj"
COPY . .
WORKDIR "/src/DigitalHubLMS.Web"
RUN dotnet build "DigitalHubLMS.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DigitalHubLMS.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DigitalHubLMS.Web.dll"]
