package service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Motel;
import repository.IMotelRepository;
import repository.impl.MotelRepositoryImpl;
import service.IMotelService;

public class MotelServiceImpl implements IMotelService {

    private final IMotelRepository iMotelRepository = new MotelRepositoryImpl();

    @Override
    public List<Motel> selectAllMotel() {
        return iMotelRepository.selectAll();
    }

    @Override
    public void insertOne(Motel motel) {
        iMotelRepository.insertOne(motel);
    }

    @Override
    public Map<String, String> validate(Motel motel) {

        String DATE_TIME_FORMAT_REGEX = "^\\d{4}-\\d{2}-\\d{2}$";

        Map<String, String> error = new HashMap<>();
        if (motel.getCustomerName() == null || "".equals(motel.getCustomerName())) {
            error.put("customer_name", "Khong duoc de trong");
        } else if (!motel.getCustomerName().matches("^[a-zA-Z ]{5,50}$")) {
            error.put("customer_name", "Phai la Ki tu chu va trong khoang 5-50 ki tu");
        }
        if (motel.getPhoneNumber() == null || "".equals(motel.getPhoneNumber())) {
            error.put("phone", "Khong duoc de trong");
        } else if (!motel.getPhoneNumber().matches("^\\d{10}$")) {
            error.put("phone", "Phai co 10 so");
        }

        if (!motel.getDayRent().matches(DATE_TIME_FORMAT_REGEX)) {
            error.put("rent_date", "Khong Hop le");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date rentDate = null;
            try {
                rentDate = fmt.parse(motel.getDayRent());
                if (rentDate != null && rentDate.compareTo(new Date()) < 0) {
                    error.put("rent_date", "Khong duoc nhap ngay trong qua khu");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                error.put("rent_date", "Khong Hop le");
            }
        }
        if (motel.getRentTypeId() == 0) {
            error.put("rent_type", "Khong duoc de trong");
        }

        return error;
    }

    @Override
    public boolean findById(Integer motelId) {
        return iMotelRepository.findById(motelId);
    }

    @Override
    public void deleteCustomer(Integer motelId) {
        iMotelRepository.deleteOne(motelId);
    }

    @Override
    public List<Motel> search(String motelId, String customerName, String phone) {
        return iMotelRepository.search(motelId, customerName, phone);
    }
}
