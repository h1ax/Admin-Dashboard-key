<?php
//include 'lib1.php';

function encode($str, $key) {
    $len = strlen($str);
    $encodedStr = '';
    
    for ($i = 0; $i < $len; $i++) {
        $encodedStr .= chr(ord($str[$i]) ^ ord($key));
    }

    return $encodedStr;
}

function decode($str, $key) {
    return encode($str, $key);
}

function hexCharToInt($hex) {
    if ($hex >= '0' && $hex <= '9') {
        return ord($hex) - ord('0');
    } elseif ($hex >= 'A' && $hex <= 'F') {
        return ord($hex) - ord('A') + 10;
    } elseif ($hex >= 'a' && $hex <= 'f') {
        return ord($hex) - ord('a') + 10;
    }
    return -1;
}

function intToHexChar($num) {
    if ($num >= 0 && $num <= 9) {
        return chr($num + ord('0'));
    } elseif ($num >= 10 && $num <= 15) {
        return chr($num - 10 + ord('A'));
    }
    return '';
}

function encodeToHex($str) {
    $len = strlen($str);
    $hexStr = '';

    for ($i = 0; $i < $len; $i++) {
        $hexStr .= intToHexChar(ord($str[$i]) >> 4);
        $hexStr .= intToHexChar(ord($str[$i]) & 0x0F);
    }

    return $hexStr;
}

function decodeFromHex($hexStr) {
    $len = strlen($hexStr);
    if ($len % 2 != 0) {
        return null;
    }

    $str = '';

    for ($i = 0; $i < $len / 2; $i++) {
        $high = hexCharToInt($hexStr[$i * 2]);
        $low = hexCharToInt($hexStr[$i * 2 + 1]);
        $str .= chr(($high << 4) | $low);
    }

    return $str;
}

function enc($m) {
    $encoded = encode($m, 'k');
    if (!$encoded) return null;

    $encodedHex = encodeToHex($encoded);
    return $encodedHex;
}

function dec($m) {
    $decodedHex = decodeFromHex($m);
    if (!$decodedHex) return null;

    $decoded = decode($decodedHex, 'k');
    return $decoded;
}

function getDbConnection()
{
    $servername = "localhost";
    $dbname = "th1axsite_core_panel";
    $dbusername = "th1axsite_core";
    $dbpassword = "Nthh8124@";

    try {
        $conn = new PDO(
            "mysql:host=$servername;dbname=$dbname",
            $dbusername,
            $dbpassword
        );
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        return null;
    }
}

function addKey($admin, $key, $startDate, $endDate, $len, $udid)
{
    $conn = getDbConnection();
    if ($conn === null) {
        return false;
    }
    $adminl = md5($admin);
    try {
        $stmt = $conn->prepare("INSERT INTO all_keys (admin, `key`, startDate, endDate, len, udid) 
                                VALUES (:admin, :key, :startDate, :endDate, :len, :udid)");
        $stmt->bindParam(":admin", $adminl);
        $stmt->bindParam(":key", $key);
        $stmt->bindParam(":startDate", $startDate);
        $stmt->bindParam(":endDate", $endDate);
        $stmt->bindParam(":len", $len);
        $stmt->bindParam(":udid", $udid);

        $stmt->execute();

        return true;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        return false;
    } finally {
        $conn = null;
    }
}

function deleteKey($admin, $key)
{
    $conn = getDbConnection();
    if ($conn === null) {
        return false;
    }

    try {
        $stmt = $conn->prepare(
            "DELETE FROM all_keys WHERE admin = :admin AND `key` = :key"
        );
        $stmt->bindParam(":admin", md5($admin));
        $stmt->bindParam(":key", $key);

        $stmt->execute();
        return $stmt->rowCount() > 0; // Trả về true nếu có hàng bị xóa
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        return false;
    } finally {
        $conn = null;
    }
}

function resetKey($admin, $key)
{
    $conn = getDbConnection();
    if ($conn === null) {
        return false;
    }
    try {
        // Truy vấn để lấy thông tin key
        $stmt = $conn->prepare("SELECT * FROM all_keys WHERE `key` = :key");
        $stmt->bindParam(":key", $key);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            // Cập nhật thông tin key nếu tồn tại
            $stmt = $conn->prepare(
                "UPDATE `all_keys` SET `admin`=:admin, `startDate`=:startDate, `endDate`=:endDate, `len`=:len, `udid`=NULL WHERE `key` = :key"
            );

            // Đặt giá trị cho các tham số
            $stmt->bindValue(":admin", $result["admin"]);
            $stmt->bindValue(":key", $result["key"]);
            $stmt->bindValue(":startDate", $result["startDate"]);
            $stmt->bindValue(":endDate", $result["endDate"]);
            $stmt->bindValue(":len", $result["len"]);

            $stmt->execute();
            return true;
        } else {
            return false;
        }
    } catch (PDOException $e) {
        echo "Update_info_Error: " . $e->getMessage();
        return false;
    } finally {
        // Đóng kết nối
        $conn = null;
    }
}

function check($username, $password)
{
    $username = md5($username);
    $password = md5($password);
    try {
        $conn = getDbConnection();
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Chuẩn bị và thực thi truy vấn SQL
        $stmt = $conn->prepare(
            "SELECT password FROM admins WHERE username = :username"
        );
        $stmt->bindParam(":username", $username);
        $stmt->execute();

        // Kiểm tra kết quả truy vấn
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            //echo $result['password'];
            // Sử dụng password_verify để kiểm tra mật khẩu
            if ($password === $result["password"]) {
                //echo "1";
                return true; // Đăng nhập thành công
            }
        }
    } catch (PDOException $e) {
        // Xử lý lỗi kết nối hoặc truy vấn
        //echo "3";
        error_log("Database error: " . $e->getMessage());
    }
    //echo "2";
    return false; // Đăng nhập không thành công
}

function isAdminDB($username)
{
    $conn = getDbConnection();
    if ($conn === null) {
        return 0;
    }
    try {
        $adminHash = md5($username);
        $stmt = $conn->prepare("SELECT * FROM admins WHERE username = :admin");
        $stmt->bindParam(":admin", $adminHash);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return intval($result["isAdmin"]);
    } catch (PDOException $e) {
        return 0;
    } finally {
        // Đóng kết nối
        $conn = null;
    }
}

function createReseller($username, $password)
{
    $username = md5($username);
    $password = md5($password);
    $isAdmin = 0; // Đảm bảo isAdmin được thiết lập đúng
    try {
        $conn = getDbConnection();
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Chuẩn bị và thực thi truy vấn SQL
        $stmt = $conn->prepare("INSERT INTO admins (id, username, password, isAdmin) 
                                VALUES (NULL, :username, :password, :isAdmin)");
        $stmt->bindParam(":username", $username);
        $stmt->bindParam(":password", $password);
        $stmt->bindParam(":isAdmin", $isAdmin);

        $stmt->execute();

        // Kiểm tra kết quả truy vấn
        if ($stmt->rowCount() > 0) {
            return true; // Tạo reseller thành công
        }
    } catch (PDOException $e) {
        // Xử lý lỗi kết nối hoặc truy vấn
        error_log("Database error: " . $e->getMessage());
    }
    return false; // Tạo reseller không thành công
}

function viewkey()
{
    $conn = getDbConnection();
    if ($conn === null) {
        return json_encode([]);
    }
    try {
        $adminHash = md5($_SESSION["u"]);
        $stmt = $conn->prepare("SELECT * FROM all_keys WHERE admin = :admin");
        $stmt->bindParam(":admin", $adminHash);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($result);
    } catch (PDOException $e) {
        return json_encode(["error" => $e->getMessage()]);
    } finally {
        // Đóng kết nối
        $conn = null;
    }
}

function readKey($key, $id)
{
    $conn = getDbConnection();
    if ($conn === null) {
        return json_encode([]);
    }
    try {
        // Truy vấn để lấy thông tin key
        $stmt = $conn->prepare("SELECT * FROM all_keys WHERE `key` = :key");
        $stmt->bindParam(":key", $key);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if (
            $result &&
            $result["startDate"] === null &&
            $result["udid"] === null
        ) {
            //trường hợp key chưa sử dụng
            // Cập nhật thông tin key nếu chưa được sử dụng
            $stmt = $conn->prepare(
                "UPDATE `all_keys` SET `admin`=:admin, `key`=:key, `startDate`=:startDate, `endDate`=:endDate, `len`=:len, `udid`=:udid WHERE `key` = :key"
            );

            $now = new DateTime();
            $now->modify("+7 hours");
            // Đặt giá trị cho startDate
            $value4 = $now->format("Y-m-d H:i:s");
            $endDate = clone $now;
            $endDate->modify("+" . $result["len"] . " hours");
            $value5 = $endDate->format("Y-m-d H:i:s");

            // Đặt giá trị cho các tham số
            $stmt->bindValue(":id", null);
            $stmt->bindValue(":admin", $result["admin"]);
            $stmt->bindValue(":key", $key);
            $stmt->bindValue(":startDate", $value4);
            $stmt->bindValue(":endDate", $value5);
            $stmt->bindValue(":len", $result["len"]);
            $stmt->bindValue(":udid", $id);

            $stmt->execute();
            //echo enc("com.riotgames.league.wildriftvn");
            return true;
        }
        if (
            $result &&
            $result["startDate"] !== null &&
            $result["udid"] === null
        ) {
            //trường hợp key đẫ đăng nhập + reset id máy
            // Cập nhật thông tin key nếu chưa được sử dụng
            $stmt = $conn->prepare(
                "UPDATE `all_keys` SET `admin`=:admin, `key`=:key, `startDate`=:startDate, `endDate`=:endDate, `len`=:len, `udid`=:udid WHERE `key` = :key"
            );

            $now = new DateTime();
            $now->modify("+7 hours");
            // Đặt giá trị cho startDate
            $value4 = $now->format("Y-m-d H:i:s");
            $endDate = clone $now;
            $endDate->modify("+" . $result["len"] . " hours");
            $value5 = $endDate->format("Y-m-d H:i:s");

            // Đặt giá trị cho các tham số
            $stmt->bindValue(":id", null);
            $stmt->bindValue(":admin", $result["admin"]);
            $stmt->bindValue(":key", $result["key"]);
            $stmt->bindValue(":startDate", $result["startDate"]);
            $stmt->bindValue(":endDate", $result["endDate"]);
            $stmt->bindValue(":len", $result["len"]);
            $stmt->bindValue(":udid", $id);
            $stmt->execute();
            //
            return true;
        }
        if ($result && $result["startDate"] && $result["udid"]) {
            // Key đã được sử dụng, kiểm tra logic ngày kết thúc
            $endDate = new DateTime();
            $startDate = new DateTime($result["endDate"]);
            if ($endDate > $startDate) {
                echo enc("Out_of_dated");
                return false; // Key hợp lệ
            } else {
                
                return true;
            }
            
        }
    } catch (PDOException $e) {
        echo enc("Update_info_Error: $e");
        return false;
    } finally {
        // Đóng kết nối
        $conn = null;
    }
}

?>
