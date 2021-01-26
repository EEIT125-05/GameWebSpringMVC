<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>GameBar</title>
<style>
/* body { */
/* 	background-color: #ffffff; */
/* 	background-image: */
/* 		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 2000 1500'%3E%3Cdefs%3E%3Cellipse fill='none' stroke-width='1' id='a' rx='600' ry='450'/%3E%3C/defs%3E%3Cg transform='scale(0.982)' style='transform-origin:center'%3E%3Cg transform='rotate(180 0 0)' style='transform-origin:center'%3E%3Cg transform='rotate(-60.8 0 0)' style='transform-origin:center'%3E%3Cg transform='translate(1000 750)'%3E%3Cuse stroke='%23f7ebeb' href='%23a' transform='rotate(-22.8 0 0) scale(0.772)'/%3E%3Cuse stroke='%23f3e6e7' href='%23a' transform='rotate(-19 0 0) scale(0.81)'/%3E%3Cuse stroke='%23eee2e3' href='%23a' transform='rotate(-15.2 0 0) scale(0.848)'/%3E%3Cuse stroke='%23eadddf' href='%23a' transform='rotate(-11.4 0 0) scale(0.886)'/%3E%3Cuse stroke='%23e5d9dc' href='%23a' transform='rotate(-7.6 0 0) scale(0.924)'/%3E%3Cuse stroke='%23e0d5d8' href='%23a' transform='rotate(-3.8 0 0) scale(0.962)'/%3E%3Cuse stroke='%23dcd0d4' href='%23a'/%3E%3Cuse stroke='%23d7ccd1' href='%23a' transform='rotate(3.8 0 0) scale(1.038)'/%3E%3Cuse stroke='%23d2c8cd' href='%23a' transform='rotate(7.6 0 0) scale(1.076)'/%3E%3Cuse stroke='%23cec3c9' href='%23a' transform='rotate(11.4 0 0) scale(1.114)'/%3E%3Cuse stroke='%23c9bfc6' href='%23a' transform='rotate(15.2 0 0) scale(1.152)'/%3E%3Cuse stroke='%23c4bbc2' href='%23a' transform='rotate(19 0 0) scale(1.19)'/%3E%3Cuse stroke='%23bfb7be' href='%23a' transform='rotate(22.8 0 0) scale(1.228)'/%3E%3Cuse stroke='%23bab3bb' href='%23a' transform='rotate(26.6 0 0) scale(1.266)'/%3E%3Cuse stroke='%23b5afb7' href='%23a' transform='rotate(30.4 0 0) scale(1.304)'/%3E%3Cuse stroke='%23b0abb3' href='%23a' transform='rotate(34.2 0 0) scale(1.342)'/%3E%3Cuse stroke='%23aba6b0' href='%23a' transform='rotate(38 0 0) scale(1.38)'/%3E%3Cuse stroke='%23a6a2ac' href='%23a' transform='rotate(41.8 0 0) scale(1.418)'/%3E%3Cuse stroke='%23a19fa8' href='%23a' transform='rotate(45.6 0 0) scale(1.456)'/%3E%3Cuse stroke='%239c9ba4' href='%23a' transform='rotate(49.4 0 0) scale(1.494)'/%3E%3Cuse stroke='%239797a1' href='%23a' transform='rotate(53.2 0 0) scale(1.532)'/%3E%3Cuse stroke='%2392939d' href='%23a' transform='rotate(57 0 0) scale(1.57)'/%3E%3Cuse stroke='%238d8f99' href='%23a' transform='rotate(60.8 0 0) scale(1.608)'/%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); */
/* 	background-attachment: fixed; */
/* 	background-size: cover; */
/* } */
header.masthead {
  padding-top: 10rem;
  padding-bottom: calc(10rem - 4.5rem);
  background:  url("https://p9.itc.cn/images01/20201112/e70156c925964817a2d7c031e17f447a.jpeg");
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-size: cover;
}
header.masthead h1 {
  font-size: 2.25rem;
}
@media (min-width: 992px) {
  header.masthead {
    height: 100vh;
    min-height: 40rem;
    padding-top: 4.5rem;
    padding-bottom: 0;
  }
  header.masthead p {
    font-size: 1.15rem;
  }
  header.masthead h1 {
    font-size: 3rem;
  }
}
@media (min-width: 1200px) {
  header.masthead h1 {
    font-size: 3.5rem;
  }
}
</style>
<%@ include file="Link.jsp"%>
</head>

<body>
	<%@ include file="Header.jsp"%>

<header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold"></h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 font-weight-light mb-5"></p>
                        
                    </div>
                </div>
            </div>
        </header>
	<%@ include file="Foot.jsp"%>
</body>

</html>
