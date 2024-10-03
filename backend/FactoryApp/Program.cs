using System;
using System.Collections.Generic;

public interface IRobotService
{
    Robot BuildRobot(Parts parts, Enum robotType);
}

public interface ICarService
{
    Car BuildCar(Parts parts, Enum carType);
}

public interface IPartsService
{
    List<Parts> GetParts(Enum type);
}

public enum RobotType
{
    RoboticDog,
    RoboticCat,
    RoboticDrone,
    RoboticCar
}

public enum CarType
{
    Toyota,
    Ford,
    Opel,
    Honda
}

public class Robot { }
public class Car { }
public class Parts { }

public class Factory
{
    private readonly IRobotService _robotService;
    private readonly IPartsService _partsService;
    private readonly ICarService _carService;

    public Factory(IRobotService robotService, IPartsService partsService, ICarService carService)
    {
        _robotService = robotService;
        _partsService = partsService;
        _carService = carService;
    }

    // Factory method for building robots aand cars
    public Robot BuildRobot(RobotType robotType)
    {
        var parts = _partsService.GetParts(robotType);
        return _robotService.BuildRobot(parts.First(), robotType);
    }

    public Car BuildCar(CarType carType)
    {
        var parts = _partsService.GetParts(carType);

        return _carService.BuildCar(parts.First(), carType);
    }
}

// Displays when running application
public class RobotService : IRobotService
{
    public Robot BuildRobot(Parts parts, Enum robotType)
    {
        Console.WriteLine($"Building {robotType} robot.");
        return new Robot();
    }
}

public class CarService : ICarService
{
    public Car BuildCar(Parts parts, Enum carType)
    {
        Console.WriteLine($"Building {carType} car.");
        return new Car();
    }
}

public class PartsService : IPartsService
{
    public List<Parts> GetParts(Enum type)
    {
        Console.WriteLine($"Fetching parts for {type}.");
        return new List<Parts> { new Parts() };
    }
}

class Program
{
    static void Main(string[] args)
    {
        // Initialize services
        IRobotService robotService = new RobotService();
        ICarService carService = new CarService();
        IPartsService partsService = new PartsService();

        Factory factory = new Factory(robotService, partsService, carService);

        // Build a robot and a car
        factory.BuildRobot(RobotType.RoboticDog);
        factory.BuildCar(CarType.Toyota);
    }
}
