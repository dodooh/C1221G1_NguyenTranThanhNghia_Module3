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
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

public class CustomerServiceImpl implements ICustomerService {

    ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAll();
    }

    private Map<String, String> validate(Customer customer) {
        String CUSTOMER_CODE_REGEX = "^KH-\\d{4}$";
        String PHONE_NUMBER_REGEX = "^(091|090|\\(\\+84\\)90|\\(\\+84\\)91)\\d{7}$";
        String EMAIL_ADDRESS_REGEX = "^\\w+([.-]?\\w+)*@[a-z]+\\.(\\w+){2,}(\\.\\w{2,3})?";
        String DATE_TIME_FORMAT_REGEX = "^\\d{4}-\\d{2}-\\d{2}$";
        String ID_CARD_REGEX = "^\\d{9}$";
        Map<String, String> errors = new HashMap<>();
        if (customer.getCustomerCode().length() == 0) {
            errors.put("customer_code", "CUSTOMER CODE CAN NOT BE EMPTY");
        } else if (!customer.getCustomerCode().matches(CUSTOMER_CODE_REGEX)) {
            errors.put("customer_code", "CUSTOMER CODE MUST MATCH PATTERN 'KH-XXXX'");
        }
        if (customer.getCustomerPhone().length() == 0) {
            errors.put("phone_number", "PHONE NUMBER CAN NOT BE EMPTY");
        } else if (!customer.getCustomerPhone().matches(PHONE_NUMBER_REGEX)) {
            errors.put("phone_number", "PHONE NUMBER MUST BE START WITH 091 OR 090 OR (+84)90 OR (+84)91 AND 7 NUMBERS AFTER");
        }
        if (!customer.getCustomerIdCard().matches(ID_CARD_REGEX)) {
            errors.put("identify_number", "ID CARD MUST HAVE 9 NUMBERS");
        }
        if (!customer.getCustomerMail().matches(EMAIL_ADDRESS_REGEX)) {
            errors.put("email", "INVALID EMAIL FORMAT");
        }

        if (!customer.getCustomerDob().matches(DATE_TIME_FORMAT_REGEX)) {
            errors.put("date_of_birth", "INVALID DATE FORMAT");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                birthdayDate = fmt.parse(customer.getCustomerDob());
                // KIEM TRA NGAY CO TRONG QUA KHU KHONG
                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
                    errors.put("date_of_birth", "MUST BE PAST");
                }
                // KIEM TRA TUOI > 18
                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
                System.out.println(years);
                if (years < 18) {
                    errors.put("date_of_birth", "MUST BE > 18 YEAR OLD");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                errors.put("date_of_birth", "INVALID DATE FORMAT");
            }
        }

        if (customer.getCustomerTypeId()== null) {
            errors.put("customer_type_id", "SELECT 1 CUSTOMER TYPE");
        }

        return errors;
    }

    @Override
    public Map<String, String> insertOne(Customer customer) {
        Map<String, String> errors = this.validate(customer);
        if (errors.isEmpty()) {
            iCustomerRepository.insertOne(customer);
        }
        return errors;
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public Map<String, String> updateOne(Customer customer) {
        Map<String, String> errors = this.validate(customer);
        if (errors.isEmpty()) {
            iCustomerRepository.updateOne(customer);
        }
        return errors;
    }

    @Override
    public void deleteCustomer(Integer id) {
        iCustomerRepository.deleteOne(id);
    }

    @Override
    public List<Customer> search(String keyword, String phone, String customerType) {
        return iCustomerRepository.search(keyword, phone, customerType);
    }
}
