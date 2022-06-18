FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .

WORKDIR /src/ApartmentRental.API
RUN dotnet publish ApartmentRental.API.csproj -c Release -o /app/publish

FROM build AS tests
WORKDIR /src/ApartmentRental.Tests
RUN dotnet test

FROM build AS update-database
WORKDIR /src
RUN dotnet tool install --global dotnet-ef
RUN dotnet new tool-manifest --force
RUN dotnet tool install dotnet-ef
RUN dotnet tool restore
ENV PATH $PATH:/root/.dotnet/tools
RUN dotnet ef database update --project ApartmentRental.Infrastructure --startup-project ApartmentRental.API

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app
COPY --from=update-database /src/ApartmentRental.API/dbo.ApartmentRental.db .
COPY --from=update-database /app/publish .
ENTRYPOINT ["dotnet", "ApartmentRental.API.dll"]