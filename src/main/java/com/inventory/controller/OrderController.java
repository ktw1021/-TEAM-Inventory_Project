package com.inventory.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inventory.repositories.vo.BookInventoryVo;
import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.BookInventoryService;
import com.inventory.services.BookService;
import com.inventory.services.OrderService;
import com.inventory.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/branch/order")
@Controller
public class OrderController {
	@Autowired
	BookService bookService;
	@Autowired
	OrderService orderService;
	@Autowired
	BookInventoryService bookInventoryService;
	@Autowired
	UserService userService;
	// 현재 지점의 재고 데이터를 가져오는 메서드
	@GetMapping("/getData")
	@ResponseBody
	public List<BookInventoryVo> getData(HttpSession session) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		System.err.println(bookInventoryService.getList(vo.getBranchId()));
		return bookInventoryService.getList(vo.getBranchId());
	}

	// 지점의 재고에서 특정 책을 검색하는 메서드
	@GetMapping("/searchBooks")
	@ResponseBody
	public List<BookInventoryVo> searchBooks(@RequestParam("query") String query, HttpSession session) {
		UserVo vo = (UserVo) session.getAttribute("authUser");

		return bookInventoryService.search(vo.getBranchId(), query);
	}

	// 세션에 수량을 저장하는 메서드
	@PostMapping("/saveQuantities")
	@ResponseBody
	public String saveQuantities(@RequestBody List<Map<String, Object>> bookQuantities, HttpSession session) {
		try {
			// 세션에서 기존 데이터를 가져오기
			List<Map<String, Object>> pastQuantities = (List<Map<String, Object>>) session.getAttribute("quantities");
			if (pastQuantities == null) {
				// 기존 값이 없는 경우 새 리스트를 생성
				pastQuantities = new ArrayList<>();
			}

			// 전달된 데이터로 기존 리스트 업데이트
			for (Map<String, Object> newQuantity : bookQuantities) {
				String bookCode = (String) newQuantity.get("bookCode");
				int newQuantityValue = (Integer) newQuantity.get("quantity");

				// 기존 항목 찾기
				boolean found = false;
				for (Map<String, Object> existingQuantity : pastQuantities) {
					if (existingQuantity.get("bookCode").equals(bookCode)) {
						// 기존 수량에 새로운 수량을 추가
						int existingQuantityValue = (Integer) existingQuantity.get("quantity");
						existingQuantity.put("quantity", existingQuantityValue + newQuantityValue);
						found = true;
						break;
					}
				}

				if (!found) {
					// 새로운 항목 추가
					pastQuantities.add(newQuantity);
				}
			}

			// 세션에 업데이트된 수량 저장
			session.setAttribute("quantities", pastQuantities);

			return "Quantities saved to session successfully";
		} catch (Exception e) {
			e.printStackTrace(); // 로그에 오류 정보 기록
			return "Error saving quantities";
		}
	}

	// 세션에 저장된 장바구니 항목을 가져오는 메서드
	@GetMapping("/getCart")
	@ResponseBody
	public List<Map<String, Object>> getCart(HttpSession session) {
		List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("quantities");
		if (cart == null) {
			cart = new ArrayList<>();
		}
		return cart;
	}

	// 장바구니에서 항목을 삭제하는 메서드
	@PostMapping("/deleteFromCart")
	@ResponseBody
	public String deleteFromCart(@RequestParam("bookCode") String bookCode, HttpSession session) {
		// 세션에서 장바구니 데이터 가져오기
		List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("quantities");
		if (cart == null) {
			cart = new ArrayList<>();
		}

		// 장바구니에서 항목 제거
		Iterator<Map<String, Object>> iterator = cart.iterator();
		boolean itemRemoved = false;

		while (iterator.hasNext()) {
			Map<String, Object> item = iterator.next();
			if (bookCode.equals(item.get("bookCode"))) {
				iterator.remove(); // 항목 제거
				itemRemoved = true;
				break;
			}
		}

		// 세션에 업데이트된 장바구니 저장
		session.setAttribute("quantities", cart);

		if (itemRemoved) {
			return "Item removed from cart.";
		} else {
			return "Item not found in cart.";
		}
	}

	// 장바구니를 비우는 메서드
	@PostMapping("/clearCart")
	@ResponseBody
	public String clearCart(HttpSession session) {
		// 장바구니 데이터를 가져옴
		Object cartObj = session.getAttribute("quantities");

		if (cartObj == null) {
			return "Cart is already empty.";
		}

		// 장바구니가 비어 있는지 확인
		List<?> cart = (List<?>) cartObj;
		if (cart.isEmpty()) {
			return "Cart is already empty.";
		}

		// 장바구니를 비움
		session.removeAttribute("quantities");
		return "Cart cleared successfully!";
	}

	// 주문 페이지를 로드하는 메서드
	@RequestMapping("/form")
	public String orderList(HttpSession session, Model model) {
		// 로그인 시 저장한 session authUser를 받아와 branchId 기반으로 지점 branch_inventory 테이블 데이터 연결
		// 데이터를 받아와 지점 교재 재고 현황을 모델에 저장
		UserVo vo = (UserVo) session.getAttribute("authUser");

		List<BookInventoryVo> list = bookInventoryService.getList(vo.getBranchId());
		model.addAttribute("list", list);

		Boolean addCart = (Boolean) session.getAttribute("addCart");
		if (addCart != null && addCart) {
			model.addAttribute("addCart", true);
			session.removeAttribute("addCart");
		}
		// session에 저장된 장바구니 리스트를 받아오고 모델에 추가해 jsp에 전달
		Object cartObject = session.getAttribute("cart");
		List<OrderVo> cartList = (List<OrderVo>) cartObject;
		if (cartList == null) {
			cartList = new ArrayList<>();
		}
		for (OrderVo orderVo : cartList) {
			BookInventoryVo book = new BookInventoryVo();
			book.setBookCode(orderVo.getBookCode());
			book.setBranchId(vo.getBranchId());
			orderVo.setInventory(bookInventoryService.getInventory(book));
		}

		Boolean success = (Boolean) session.getAttribute("success");
		if (success != null && !success) {
			model.addAttribute("success", false);
			session.removeAttribute("success");
		}

		model.addAttribute("cartList", cartList);
		return "branches/branch_order_form";
	}

	// 주문 기록 페이지를 로드하는 메서드
	@RequestMapping("/list")
	public String orderHistory(Model model, HttpSession session, HttpServletRequest request) {
		// 로그인 시 저장한 session authUser를 받아옴
		
		Map <String, String> params = new HashMap <>();
		String checked = request.getParameter("checked");
        if (checked != null && !checked.trim().isEmpty()) {
            params.put("checked", checked);
        }
        String no = request.getParameter("no");
        if (no != null && !no.trim().isEmpty()) {
            params.put("no", no);
        }
		
		UserVo vo = (UserVo) session.getAttribute("authUser");
		System.err.println(vo);
		params.put("branchId",vo.getBranchId());

		List<OrderVo> list = orderService.getOrderList(params);
		System.out.println(list);
		model.addAttribute("list", list);
		
		List<UserVo> userList = userService.selectBranchUserList(vo.getBranchId());
		System.err.println(userList);
		
		Boolean success = (Boolean) session.getAttribute("success");
		if (success != null && success) {
			model.addAttribute("success", true);
			session.removeAttribute("success");
		}
		
		model.addAttribute("userList", userList);
		model.addAttribute("authUser", vo);

		return "branches/branch_order_list";
	}


	// 주문을 확정하는 메서드
	@RequestMapping("/submit")
	public String ordering(HttpSession session, Model model) {
		UserVo vo = (UserVo) session.getAttribute("authUser");

		List<LinkedHashMap> cartData = (List<LinkedHashMap>) session.getAttribute("quantities");
		
		if (cartData != null) {
	           Iterator<LinkedHashMap> iterator = cartData.iterator();
	           while (iterator.hasNext()) {
	               LinkedHashMap map = iterator.next();
	               Integer quantity = (Integer) map.get("quantity");
	               if (quantity != null && quantity == 0) {
	                   iterator.remove();
	               }
	           }
	       }
		
		// 장바구니가 있으면 book_order 테이블에 지점 아이디 기반으로 데이터 생성
		if (cartData != null && !cartData.isEmpty()) {
			orderService.insert(vo);

			for (LinkedHashMap map : cartData) {
				OrderVo orderVo = new OrderVo();
				orderVo.setBookCode((String) map.get("bookCode"));
				orderVo.setBookName((String) map.get("bookName"));
				orderVo.setQuantity((Integer) map.get("quantity"));
				orderVo.setOrderId(orderService.getMax());
				orderVo.setUserName(vo.getName());
				orderService.insertDetail(orderVo);
			}

			// 장바구니 리스트 삭제
			session.removeAttribute("quantities");

		} else {
			session.setAttribute("success", false);
			session.removeAttribute("quantities");
			return "redirect:/branch/order/form";
		}

		session.setAttribute("success", true);
		return "redirect:/branch/order/list";
	}

	// 주문 상세 페이지를 로드하는 메서드
	@RequestMapping("/detail")
	public String orderDetail(@RequestParam("orderId") String orderId, Model model) {
		// 받아온 orderId 기반으로 주문 상세 페이지로 연결
		List<OrderVo> list = orderService.getDetailList(orderId);
		model.addAttribute("list", list);
		model.addAttribute("orderId", orderId);
		return "branches/branch_order_detail";
	}

}