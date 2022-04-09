using ApartmentRental.Infrastructure.Context;
using ApartmentRental.Infrastructure.Entities;

namespace ApartmentRental.Infrastructure.Repository;

public class LandLordRepository : ILandLordRepository
{
    private readonly MainContext _mainContext;

    public LandLordRepository(MainContext mainContext)
    {
        _mainContext = mainContext;
    }

    public Task<IEnumerable<Landlord>> GetAll()
    {
        throw new NotImplementedException();
    }

    public Task<Landlord> GetById(int id)
    {
        throw new NotImplementedException();
    }

    public Task Add(Landlord entity)
    {
        throw new NotImplementedException();
    }

    public Task Update(Landlord entity)
    {
        throw new NotImplementedException();
    }

    public Task DeleteById(int id)
    {
        throw new NotImplementedException();
    }
}