package service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.OffsetDateTime;
import java.time.Period;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Customer;
import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

public class EmployeeServiceImpl implements IEmployeeService {

    private final IEmployeeRepository iEmployeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> selectAllEmployee() {
        return iEmployeeRepository.selectAll();
    }

//    private Map<String, String> validate(Employee employee) {
//        String CUSTOMER_CODE_REGEX = "^KH-\\d{4}$";
//        String PHONE_NUMBER_REGEX = "^(091|090|\\(\\+84\\)90|\\(\\+84\\)91)\\d{7}$";
//        String EMAIL_ADDRESS_REGEX = "^\\w+([.-]?\\w+)*@[a-z]+\\.(\\w+){2,}(\\.\\w{2,3})?";
//        String DATE_TIME_FORMAT_REGEX = "^\\d{4}-\\d{2}-\\d{2}$";
//        String ID_CARD_REGEX = "^\\d{9}$";
//        Map<String, String> errors = new HashMap<>();
//        if (employee.getCustomerCode().length() == 0) {
//            errors.put("customer_code", "CUSTOMER CODE CAN NOT BE EMPTY");
//        } else if (!employee.getCustomerCode().matches(CUSTOMER_CODE_REGEX)) {
//            errors.put("customer_code", "CUSTOMER CODE MUST MATCH PATTERN 'KH-XXXX'");
//        }
//        if (employee.getCustomerPhone().length() == 0) {
//            errors.put("phone_number", "PHONE NUMBER CAN NOT BE EMPTY");
//        } else if (!employee.getCustomerPhone().matches(PHONE_NUMBER_REGEX)) {
//            errors.put("phone_number", "PHONE NUMBER MUST BE START WITH 091 OR 090 OR (+84)90 OR (+84)91 AND 7 NUMBERS AFTER");
//        }
//        if (!employee.getCustomerIdCard().matches(ID_CARD_REGEX)) {
//            errors.put("identify_number", "ID CARD MUST HAVE 9 NUMBERS");
//        }
//        if (!employee.getCustomerMail().matches(EMAIL_ADDRESS_REGEX)) {
//            errors.put("email", "INVALID EMAIL FORMAT");
//        }
//
//        if (!employee.getCustomerDob().matches(DATE_TIME_FORMAT_REGEX)) {
//            errors.put("date_of_birth", "INVALID DATE FORMAT");
//        } else {
//            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
//            Date birthdayDate = null;
//            Date current = new Date();
//            try {
//                birthdayDate = fmt.parse(employee.getCustomerDob());
//                // KIEM TRA NGAY CO TRONG QUA KHU KHONG
//                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
//                    errors.put("date_of_birth", "MUST BE PAST");
//                }
//                // KIEM TRA TUOI > 18
//                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
//                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
//                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
//                System.out.println(years);
//                if (years < 18) {
//                    errors.put("date_of_birth", "MUST BE > 18 YEAR OLD");
//                }
//            } catch (ParseException e) {
//                e.printStackTrace();
//                errors.put("date_of_birth", "INVALID DATE FORMAT");
//            }
//        }
//
//        if (employee.getCustomerTypeId()== null) {
//            errors.put("customer_type_id", "SELECT 1 CUSTOMER TYPE");
//        }
//
//        return errors;
//    }
    @Override
    public Map<String, String> insertOne(Employee employee) {
//        Map<String, String> error = validate(employee);
//        if ()
        iEmployeeRepository.insertOne(employee);
        return null;
    }

    @Override
    public Employee findById(int id) {
        return iEmployeeRepository.findById(id);
    }

    @Override
    public void updateOne(Employee employee) {
        iEmployeeRepository.updateOne(employee);
    }

    @Override
    public void deleteEmployee(Integer idToDelete) {
        iEmployeeRepository.deleteOne(idToDelete);
    }

    @Override
    public List<Employee> search(String name, String phone, String mail) {
        return iEmployeeRepository.search(name, phone, mail);
    }


}
