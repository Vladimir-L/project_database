<?php
declare(strict_types=1);
class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;
    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();

        try {
            $connection->beginTransaction();

            $this->cleanup();
            $connection->commit();

            $connection->beginTransaction();
            $this->generateEmployees(100);
            $this->generateSalaries();
            $this->generateIncome();

            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomFirstName(): string
    {
        static $randomFirstNames = ['Vladislav','Filipp','Vladislav','Gennadiy','Eduard','Anatoliy','Anatoliy','Viktor',
            'Mihail','Evgeniy','Dmitriy','Innokentiy','Semyon','Stepan','Pyotr','Valentin','Daniil','Arkadiy','Anton',
            'Matvey','Viktor','Nikolay','Timur','Grigoriy','Georgiy','Aleksandra','Alina','Nina','Diana','Mariya','Vera',
            'Ekaterina','Alyona','Elena','Alevtina','Natalya','Viktoriya','Anna','Evgeniya','Viktoriya','Inna','Elena',
            'Svetlana','Emma','Raisa','Anna','Lidiya','Elena','Alina','Natalya'];
        return $randomFirstNames[array_rand($randomFirstNames)];
    }
    private function getRandomLastName(): string
    {
        static $randomLastName = ['Dyachenko','Golovchenko','Kirilenko','Grabyanko','Velichko','Gavrilenko','Borisenko',
            'Dovzhenko','Marchenko','Kostenko','Zinchenko','Malyshko','Domeyko','Kostyrko','Yurchenko','Shevchenko',
            'Bezborodko','Kazachenko','Andrienko','Mishhenko','Ryabchenko','Kozachenko','Doroshenko','Ponomarenko',
            'Grishko','Gurchenko','Vashhenko','Vasilenko','Yakushko','Kravchenko','Romeyko','Gordeenko','Kostyushko',
            'Nikolaenko','Boyko','Averchenko','Golovko','Sokirko','Gurko','Matveenko','Czvirko','Ivanchenko','Korolenko',
            'Afanasenko','Sudienko','Baranenko','Hvostenko','Gerasimenko','Derevyanko','Ermolenko','Maczko'];
        return $randomLastName[array_rand($randomLastName)];
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=CherkasyElektroTrans', 'root', 'root', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();
        $connection->exec('DELETE FROM employe WHERE employe_id > 16');
        $connection->exec('ALTER TABLE employe AUTO_INCREMENT = 17');
        $connection->exec('DELETE FROM salary_log WHERE salary_log_id > 48');
        $connection->exec('ALTER TABLE salary_log AUTO_INCREMENT = 49');
        $connection->exec('DELETE FROM daily_transport_log WHERE daily_transport_log_id > 25 ');
        $connection->exec('ALTER TABLE daily_transport_log AUTO_INCREMENT = 26 ');
    }
    /**
     * @param int $emploueesCount
     * @throws Exception
     */
    public function generateEmployees(int $emploueesCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE EMPLOYEES ===
        $start = microtime(true);
        $position_id = $employe_first_name = $employe_last_name = $dob = $salary = $employment_date = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 30);
        $minExpTimestamp = $currentTimestamp - (31556952 * 14);
        $maxExpTimestamp = $currentTimestamp - (31556952 * 10);
        $statement = $connection->prepare(<<<SQL
    INSERT INTO employe (position_id, employe_first_name, employe_last_name, dob, salary, employment_date)
    VALUES (:position_id, :employe_first_name, :employe_last_name, :dob, :salary, :employment_date)
SQL
        );
        $statement->bindParam(':position_id', $position_id);
        $statement->bindParam(':employe_first_name', $employe_first_name);
        $statement->bindParam(':employe_last_name', $employe_last_name);
        $statement->bindParam(':dob', $dob);
        $statement->bindParam(':salary', $salary);
        $statement->bindParam(':employment_date', $employment_date);
        for ($employe_Id = 17; $employe_Id < $emploueesCount; $employe_Id++) {
            $position_id = random_int(2, 5);
            $employe_first_name = $this->getRandomFirstName();
            $employe_last_name = $this->getRandomLastName();
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $dob = date('Y-m-d', $timestamp);
            $salary = random_int(4500, 15000);
            $expTimestamp = random_int($minExpTimestamp, $maxExpTimestamp);
            $employment_date = date('Y-m-d', $expTimestamp);
            $statement->execute();
        }
        echo 'Create employees: ' . (microtime(true) - $start) . "\n";
    }
     public function generateSalaries(): void
     {
         $connection = $this->getConnection();
         $currentTimestamp = time();
         // === CREATE PURCHASES ===
         $start = microtime(true);
         $employe_id = $monthly_salary = $date_of_issue = '';
         $statement = $connection->prepare(<<<SQL
     INSERT INTO salary_log (employe_id, monthly_salary, date_of_issue)
     VALUES (:employe_id, :monthly_salary, :date_of_issue)
 SQL
         );
         $statement->bindParam(':employe_id', $employe_id, PDO::PARAM_INT);
         $statement->bindParam(':monthly_salary', $monthly_salary);
         $statement->bindParam(':date_of_issue', $date_of_issue);

         $employeIdsStatement = $connection->query('SELECT employe_id FROM employe');
         $employeIds = $employeIdsStatement->fetchAll(PDO::FETCH_COLUMN);
         foreach ($employeIds as $employe_id) {
             for ($i = 0; $i < 1000; $i++) {
                 $monthly_salary = random_int(5000, 15000);
                 $timestamp = random_int($currentTimestamp - (31556952 * 5), $currentTimestamp);
                 $date_of_issue = date('Y-m-d', $timestamp);
                 $statement->execute();
             }
         }
         echo 'Add salary payments: ' . (microtime(true) - $start) . "\n";
     }

    public function generateIncome(): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE PURCHASES ===
        $start = microtime(true);
        $employe_id = $transport_id = $income = $working_day = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO daily_transport_log (employe_id, transport_id, income, working_day)
    VALUES (:employe_id, :transport_id, :income, :working_day)
SQL
        );
        $statement->bindParam(':employe_id', $employe_id, PDO::PARAM_INT);
        $statement->bindParam(':transport_id', $transport_id);
        $statement->bindParam(':income', $income);
        $statement->bindParam(':working_day', $working_day);

        $employeIdsStatement = $connection->query('SELECT employe_id FROM employe WHERE position_id = 2');
        $employeIds = $employeIdsStatement->fetchAll(PDO::FETCH_COLUMN);

        foreach ($employeIds as $employe_id) {
            for ($i = 0; $i < 3333; $i++) {
                $transport_id = random_int(1, 13);
                $income = random_int(200, 800);
                $timestamp = random_int($currentTimestamp - (31556952 * 10), $currentTimestamp);
                $working_day = date('Y-m-d', $timestamp);
                $statement->execute();
            }
        }
        echo 'Create daily income: ' . (microtime(true) - $start) . "\n";
    }
}
$fixturesGenerator = new Fixtures();
$fixturesGenerator->generate();