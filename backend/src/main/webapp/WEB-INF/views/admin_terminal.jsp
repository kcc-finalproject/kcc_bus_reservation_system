<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../resources/css/header.css" />
    <link rel="stylesheet" href="../../resources/css/admin_terminal.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js"></script>
    <title>Document</title>
  </head>
  <body>
    <!-- update Modal -->
    <div
      class="modal fade"
      id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" id="terminalId">
        <div class="modal-content">
          <div class="modal-header">
            <h1
              class="modal-title fs-5"
              id="staticBackdropLabel"
              style="font: 900 15px Noto sans KR; color: black"
            >
              터미널 수정
            </h1>
            <button
              type="button"
              class="btn-primary"
              id="delete-terminal"
              style="
                width: 5rem;
                height: 2rem;
                background-color: #dc2e2e;
                border: none;
                border-radius: 0.25rem;
              "
              data-bs-dismiss="modal"
            >
              터미널 삭제
            </button>
          </div>
          <div class="modal-body">
            <label
              for="exampleFormControlInput1"
              class="form-label"
              style="
                font: 750 14px Noto sans KR;
                margin: 0px 0px 10px 10px;
                color: #5c5c5c;
              "
            >
              터미널 이름
            </label>
            <div class="form-floating" style="margin-left: 10px">
              <input
                type="text"
                class="form-control"
                id="terminalName"
                value="동서울"
                style="
                  background-color: #f4f4f4;
                  border: none;
                  border-radius: 10px;
                  padding: 0rem, 1rem;
                  font: 600 15px Noto sans KR;
                  height: 5vh;
                "
              />
            </div>
          </div>
          <div class="modal-body" style="padding: 0rem 1rem 1rem 1rem">
            <label
              for="exampleFormControlInput1"
              class="form-label"
              style="
                font: 750 14px Noto sans KR;
                margin: 0px 0px 10px 10px;
                color: #5c5c5c;
              "
            >
              주소
            </label>
            <div class="form-floating" style="margin-left: 10px">
              <input
                type="text"
                class="form-control"
                id="address"
                value="서울특별시 종로구 창경궁로 254"
                style="
                  background-color: #f4f4f4;
                  border: none;
                  border-radius: 10px;
                  padding: 0rem, 1rem;
                  font: 600 15px Noto sans KR;
                  height: 5vh;
                "
              />
            </div>
          </div>
          <div class="modal-body" style="padding: 0rem 1rem 1rem 1rem">
            <label
              for="exampleFormControlInput1"
              class="form-label"
              style="
                font: 750 14px Noto sans KR;
                margin: 0px 0px 10px 10px;
                color: #5c5c5c;
              "
            >
              전화번호
            </label>
            <div class="form-floating" style="margin-left: 10px">
              <input
                type="text"
                class="form-control"
                id="phoneNumber"
                value="전화번호를 입력하세요"
                style="
                  background-color: #f4f4f4;
                  border: none;
                  border-radius: 10px;
                  padding: 0rem, 1rem;
                  font: 600 15px Noto sans KR;
                  height: 5vh;
                "
              />
            </div>
          </div>

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button
              id="saveTerminal"
              type="button"
              class="btn btn-primary"
              style="background-color: #212954"
              data-bs-dismiss="modal"
            >
              저장
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- create Modal -->
    <div
      class="modal fade"
      id="staticBackdrop2"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1
              class="modal-title fs-5"
              id="staticBackdropLabel"
              style="font: 900 15px Noto sans KR; color: black"
            >
              터미널 등록
            </h1>
          </div>
          <div class="modal-body">
            <label
              for="exampleFormControlInput1"
              class="form-label"
              style="
                font: 750 14px Noto sans KR;
                margin: 0px 0px 10px 10px;
                color: #5c5c5c;
              "
            >
              터미널 이름
            </label>
            <div class="form-floating" style="margin-left: 10px">
              <input
                type="text"
                class="form-control"
                id="insertTerminalName"
                placeholder="터미널 이름을 입력해주세요."
                style="
                  background-color: #f4f4f4;
                  border: none;
                  border-radius: 10px;
                  padding: 0rem, 1rem;
                  font: 600 15px Noto sans KR;
                  height: 5vh;
                "
              />
            </div>
          </div>
          <div class="modal-body" style="padding: 0rem 1rem 1rem 1rem">
            <label
              for="exampleFormControlInput1"
              class="form-label"
              style="
                font: 750 14px Noto sans KR;
                margin: 0px 0px 10px 10px;
                color: #5c5c5c;
              "
            >
              주소
            </label>
            <div class="form-floating" style="margin-left: 10px">
              <input
                type="text"
                class="form-control"
                id="insertTerminalAddress"
                placeholder="주소를 입력해주세요."
                style="
                  background-color: #f4f4f4;
                  border: none;
                  border-radius: 10px;
                  padding: 0rem, 1rem;
                  font: 600 15px Noto sans KR;
                  height: 5vh;
                "
              />
            </div>
          </div>
          <div class="modal-body" style="padding: 0rem 1rem 1rem 1rem">
            <label
              for="exampleFormControlInput1"
              class="form-label"
              style="
                font: 750 14px Noto sans KR;
                margin: 0px 0px 10px 10px;
                color: #5c5c5c;
              "
            >
              전화번호
            </label>
            <div class="form-floating" style="margin-left: 10px">
              <input
                type="text"
                class="form-control"
                id="insertTerminalPhoneNumber"
                placeholder="전화번호를 입력해주세요"
                style="
                  background-color: #f4f4f4;
                  border: none;
                  border-radius: 10px;
                  padding: 0rem, 1rem;
                  font: 600 15px Noto sans KR;
                  height: 5vh;
                "
              />
            </div>
          </div>

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button
              type="button"
              class="btn btn-primary"
              style="background-color: #212954"
              data-bs-dismiss="modal"
              id="saveTerminalBtn"
            >
              저장
            </button>
          </div>
        </div>
      </div>
    </div>
    <admin-header-component></admin-header-component>
    <div id="body_wrap">
      <section id="admin_info"></section>
      <section id="admin_all">
        <div class="container">
          <h4 style="font: 800 25px Noto Sans KR">터미널 관리</h4>
          <div class="main-body">
            <div class="row">
              <div class="col-lg-3">
                <div class="card">
                  <div class="card-body">
                    <div
                      class="d-flex flex-column align-items-center text-center"
                    >
                      <img
                        src="../../resources/img/logo.png"
                        alt="Admin image"
                        class="rounded-circle p-1 bg-light"
                        width="110"
                      />
                      <div class="mt-3">
                        <h4>관리자</h4>
                        <p>관리자님 환영합니다</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-9">
                <div class="card">
                  <div class="card-body">
                    <div class="container rcard-header" style="width: 94%">
                      <div
                        class="col-sm-9 text-secondary"
                        style="
                          display: flex;
                          justify-content: space-between;
                          width: 100%;
                        "
                      >
                        <span
                          style="font: 700 20px Noto Sans KR; color: #5c5c5c"
                        >
                          터미널 조회
                        </span>
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#staticBackdrop2"
                          style="
                            background-color: #212954 !important;
                            font: 400 20px Noto Sans KR;
                            color: #f9fafc !important;
                            width: 90px;
                          "
                        >
                          터미널 등록
                        </button>
                      </div>
                    </div>
                    <div class="container" id="container">
                      <div class="container m-4">
                        <div class="row height d-flex">
                          <div class="col-md-12">
                            <div class="form">
                              <div class="input-group">
                                <span
                                  class="input-group-text"
                                  id="basic-addon1"
                                  style="background-color: #f4f4f4"
                                >
                                  <i
                                    class="fas fa-search"
                                    style="color: #c8c8c8; opacity: 0.4"
                                  ></i>
                                </span>
                                <input
                                  type="text"
                                  class="form-control form-input"
                                  placeholder="Search"
                                  id="search-box"
                                  style="
                                    background-color: #f9fafc;
                                    font: 500 13px Noto Sans KR;
                                  "
                                />
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="table-responsive mt-4">
                          <table class="table table-hover align-middle">
                            <caption></caption>
                            <thead id="table-title">
                              <tr>
                                <th scope="col" id="th-1" style="width: 1rem">
                                  터미널ID&nbsp;&nbsp;<i
                                    class="fas fa-sort"
                                  ></i>
                                </th>
                                <th scope="col" id="th-2" style="width: 1rem">
                                  터미널이름&nbsp;&nbsp;<i
                                    class="fas fa-sort"
                                  ></i>
                                </th>
                                <th scope="col" id="th-3" style="width: 5rem">
                                  주소&nbsp;&nbsp;<i class="fas fa-sort"></i>
                                </th>
                                <th scope="col" id="th-4" style="width: 1rem">
                                  전화번호&nbsp;&nbsp;<i
                                    class="fas fa-sort"
                                  ></i>
                                </th>
                                <th
                                  scope="col"
                                  id="th-5"
                                  style="width: 1rem"
                                ></th>
                              </tr>
                            </thead>
                            <tbody id="table-body">
                            <!-- JSTL을 사용한 반복문으로 터미널 정보 출력 -->
                            <c:forEach var="terminal" items="${terminalList}">
                              <tr class="terminal-list">
                                <td id="user-id">${terminal.terminalId}</td>
                                <td id="terminal-name">${terminal.terminalName}</td>
                                <td id="terminal-address">${terminal.address}</td>
                                <td id="terminal-tel">${terminal.tel}</td>
                                <td>
                                  <button
                                          type="button"
                                          class="btn btn-primary"
                                          data-bs-toggle="modal"
                                          data-bs-target="#staticBackdrop"
                                          style="
                                        background-color: #212954 !important;
                                        font: 400 20px Noto Sans KR;
                                        color: #f9fafc !important;
                                        width: 50px;
                                      "
                                  >
                                    수정
                                  </button>
                                </td>
                              </tr>
                            </c:forEach>


                            </tbody>
                          </table>
                          <div id="pagination" class="mt-4">
                            <ul class="pagination">
                              <li class="page-item"><a class="page-link prev" href="#"> <<</a></li>
                              <li class="page-item" id="page-number"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link next" href="#"> >></a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../resources/js/admin_header.js"></script>
    <script src="/resources/js/admin_terminal.js"></script>
  </body>
</html>
