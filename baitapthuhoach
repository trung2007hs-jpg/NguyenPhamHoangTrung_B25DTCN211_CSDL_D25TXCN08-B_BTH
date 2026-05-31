players = [
    {
        "ma_ct": "CR7",
        "ten_ct": "Ronaldo",
        "so_tran": 20,
        "ban_thang": 15,
        "kien_tao": 5,
        "diem_thanh_tich": 0,
        "danh_hieu": ""
    }
]

while True:
    print("\n===== QUẢN LÝ CẦU THỦ =====")
    print("1. Hiển thị danh sách cầu thủ")
    print("2. Thêm mới cầu thủ")
    print("3. Cập nhật thông tin cầu thủ")
    print("4. Xóa cầu thủ")
    print("5. Tìm kiếm cầu thủ")
    print("6. Sắp xếp danh sách cầu thủ")
    print("7. Thống kê danh hiệu")
    print("8. Thống kê số lượng theo danh hiệu")
    print("9. Cầu thủ nhiều/ít điểm nhất")
    print("0. Thoát")
    choice = input("Chọn chức năng: ")
    match choice:

        case "1":
            if len(players) == 0:
                print("Danh sách trống")
            else:
                print(f"{'STT':<4} | {'Mã':<5} | {'Tên':<20} | {'BT':<3} | {'KT':<3} | {'Điểm':<5} | {'Danh hiệu':<10}")
                print('-' *70)
                for i, player in enumerate(players, 1):
                    print(f"{i:<4} | {player['ma_ct']:<5} | {player['ten_ct']:<20} | {player['ban_thang']:<3} | {player['kien_tao']:<3} | {player['diem_thanh_tich']:<5} | {player['danh_hieu']:<10}")

        case "2":
            ma_ct = input("Nhập mã cầu thủ: ")
            trung_ma = False
            for player in players:
                if player["ma_ct"] == ma_ct:
                    trung_ma = True
                    break
            if trung_ma:
                print("Mã cầu thủ đã tồn tại")
            else:
                ten_ct = input("Nhập tên cầu thủ: ")
                so_tran = int(input("Số trận: "))
                ban_thang = int(input("Bàn thắng: "))
                kien_tao = int(input("Kiến tạo: "))

                if so_tran < 0 or ban_thang < 0 or kien_tao < 0:
                    print("Dữ liệu không hợp lệ")
                else:
                    diem = ban_thang * 2 + kien_tao
                    if diem > 40:
                        danh_hieu = "Vàng"
                    elif diem > 20:
                        danh_hieu = "Bạc"
                    else:
                        danh_hieu = "Đồng"

                    players.append({
                        "ma_ct": ma_ct,
                        "ten_ct": ten_ct,
                        "so_tran": so_tran,
                        "ban_thang": ban_thang,
                        "kien_tao": kien_tao,
                        "diem_thanh_tich": diem,
                        "danh_hieu": danh_hieu
                    })
                    print("Thêm thành công")

        case "3":
            ma_ct = input("Nhập mã cầu thủ cần sửa: ")
            found = False

            for player in players:
                if player["ma_ct"] == ma_ct:
                    found = True
                    player["ban_thang"] = int(input("Bàn thắng mới: "))
                    player["kien_tao"] = int(input("Kiến tạo mới: "))

                    player["diem_thanh_tich"] = (player["ban_thang"] * 2 + player["kien_tao"])
                    if player["diem_thanh_tich"] > 40:
                        player["danh_hieu"] = "Vàng"
                    elif player["diem_thanh_tich"] > 20:
                        player["danh_hieu"] = "Bạc"
                    else:
                        player["danh_hieu"] = "Đồng"
                    print("Cập nhật thành công")
                    break
            if not found:
                print("Không tìm thấy cầu thủ")

        case "4":
            ma_ct = input("Nhập mã cầu thủ cần xóa: ")
            for player in players:
                if player["ma_ct"] == ma_ct:
                    confirm = input("Bạn có chắc muốn xóa? (y/n): ")
                    if confirm.lower() == "y":
                        players.remove(player)
                        print("Đã xóa")
                    else:
                        print('Đã hủy xác nhận')
                    break

        case "5":
            keyword = input("Nhập mã hoặc tên cầu thủ: ").lower()

            for player in players:
                if (keyword in player["ma_ct"].lower() or keyword in player["ten_ct"].lower()):
                    print(player)

        case "6":
            print("1. Điểm thành tích giảm dần")
            print("2. Bàn thắng giảm dần")
            choose = input("Chọn: ")

            if choose == "1":
                players.sort(key=lambda x: x["diem_thanh_tich"], reverse=True)
            elif choose == "2":
                players.sort(key=lambda x: x["ban_thang"], reverse=True)
            else:
                print('Lựa chọn không hợp lệ')
                continue
            print("Đã sắp xếp")

        case "7":
            vang = 0
            bac = 0
            dong = 0

            for player in players:
                if player["danh_hieu"] == "Vàng":
                    vang += 1
                elif player["danh_hieu"] == "Bạc":
                    bac += 1
                else:
                    dong += 1

            print("Vàng:", vang)
            print("Bạc:", bac)
            print("Đồng:", dong)

        case "8":
            vang = 0
            bac = 0
            dong = 0

            for player in players:
                if player["danh_hieu"] == "Vàng":
                    vang += 1
                elif player["danh_hieu"] == "Bạc":
                    bac += 1
                else:
                    dong += 1

            print(f"Có {vang} cầu thủ danh hiệu Vàng")
            print(f"Có {bac} cầu thủ danh hiệu Bạc")
            print(f"Có {dong} cầu thủ danh hiệu Đồng")

        case "9":
            if len(players) == 0:
                print("Danh sách trống")
            else:
                max_player = players[0]
                min_player = players[0]

                for player in players:
                    if player["diem_thanh_tich"] > max_player["diem_thanh_tich"]:
                        max_player = player
                    if player["diem_thanh_tich"] < min_player["diem_thanh_tich"]:
                        min_player = player
                print("Cầu thủ thành tích cao nhất:")
                print(max_player)
                print("Cầu thủ thành tích thấp nhất:")
                print(min_player)

        case "0":
            print("Tạm biệt")
            break

        case _:
            print("Lựa chọn không hợp lệ")