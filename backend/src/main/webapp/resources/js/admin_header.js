class Headers extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: "open" });
    this.shadowRoot.innerHTML = `
      <link rel="stylesheet" href="/resources/css/reset.css">
      <link rel="stylesheet" href="/resources/css/header.css">
      <header>
        <div id="header_wrap">
           <a href="/main"><h1>UNIBUS</h1></a>
          <ul id="header_menu">
            <li>
            <a href="http://localhost:8081/admin/">회원관리</a>
            </li>
            <li>
            <a href="http://localhost:8081/admin/terminal">터미널관리</a>
            </li>
            <li>
            <a href="http://localhost:8081/admin/route">노선관리</a>
            </li>
            <li>
            <a href="http://localhost:8081/admin/schedule">배차관리</a>
            </li>
          </ul>
          <div id="header_login_wrap">
            <button class="login_join_btn" style="display: none">회원가입</button>
            <button class="login_join_btn" style="display: none">로그인</button>
          </div>
        </div>
      </header>
    `;
  }
}

customElements.define("admin-header-component", Headers);

document.addEventListener("DOMContentLoaded", () => {
  headerMenu();
});

function headerMenu() {
  const shadowRoot = document.querySelector("header-component").shadowRoot;
  const menuItems = shadowRoot.querySelectorAll("#header_menu > li");

  menuItems.forEach((item) => {
    item.addEventListener("click", (event) => {
      event.stopPropagation();
      const currentItem = shadowRoot.querySelector(
        "#header_menu > li.selector"
      );
      if (currentItem) {
        currentItem.classList.remove("selector");
      }
      item.classList.add("selector");
    });
  });

  // 로컬 스토리지에서 저장된 선택된 메뉴 항목을 불러와서 설정합니다.
  const selectedMenu = localStorage.getItem("selectedMenu");
  if (selectedMenu) {
    const selectedItem = Array.from(menuItems).find((item) => {
      const link = item.querySelector("a");
      return link && link.getAttribute("href") === selectedMenu;
    });

    if (selectedItem) {
      const currentItem = shadowRoot.querySelector(
        "#header_menu > li.selector"
      );
      if (currentItem) {
        currentItem.classList.remove("selector");
      }
      selectedItem.classList.add("selector");
    }
  }
}
