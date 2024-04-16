import random
import os

def generate_chinese_characters_file(output_dir, num_characters):
    # 常用汉字范围：0x4e00 - 0x9FA5
    chinese_characters = []
    for _ in range(num_characters):
        # 生成一个随机常用汉字的 Unicode 编码
        chinese_characters.append(chr(random.randint(0x4e00, 0x9FA5)))

    # 将数量转换为万的单位
    if num_characters >= 10000:
        num_str = f"{num_characters/10000:.4f}万字"
    else:
        num_str = f"{num_characters}字"

    # 确保目录存在
    os.makedirs(output_dir, exist_ok=True)

    # 将汉字列表保存到文件
    output_file = os.path.join(output_dir, f"generated_text_{num_str}.txt")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(''.join(chinese_characters))

    print(f"已生成 {num_str} 到文件 {output_file} 中。")

while True:
    # 输入要生成的汉字数量
    num_characters = int(input("请输入要生成的汉字数量："))

    # 生成汉字文件
    generate_chinese_characters_file(r'D:\Homework\SWE\20240416_软件质量评测\文本\random', num_characters)
