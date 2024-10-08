package com.unibus.reservation.mapper;

import com.unibus.admin.dto.TerminalDto;
import com.unibus.reservation.dto.ReservationTerminalDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface TerminalMapper {

    List<ReservationTerminalDto> findAllTerminals();

    // 터미널 ID로 터미널 이름 조회
    String findTerminalNameById(@Param("terminalId") String terminalId);

}
