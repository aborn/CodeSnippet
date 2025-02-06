import matplotlib.pyplot as plt

# 年份数据
years = [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024]
# 城镇居民人均可支配收入数据
urban_incomes = [31195, 33616, 36396, 39251, 42359, 43834, 47412, 49283, 51821, 54844]
# 农村居民人均可支配收入数据
rural_incomes = [11422, 12363, 13432, 14617, 16021, 17131, 18931, 20133, 21691, 23119]

# 计算城镇居民收入增长率
urban_growth_rates = [0]
for i in range(1, len(urban_incomes)):
    growth_rate = (urban_incomes[i] - urban_incomes[i - 1]) / urban_incomes[i - 1]
    urban_growth_rates.append(growth_rate)

# 计算农村居民收入增长率
rural_growth_rates = [0]
for i in range(1, len(rural_incomes)):
    growth_rate = (rural_incomes[i] - rural_incomes[i - 1]) / rural_incomes[i - 1]
    rural_growth_rates.append(growth_rate)

# 设置中文字体，这里以冬青黑体为例，根据实际情况修改字体路径
from matplotlib import font_manager
font_path = '/System/Library/Fonts/STHeiti Medium.ttc'
font = font_manager.FontProperties(fname=font_path)

# 解决负号显示问题
plt.rcParams['axes.unicode_minus'] = False

# 绘制城镇居民人均可支配收入曲线
plt.plot(years, urban_incomes, marker='o', linestyle='-', color='b', label='城镇居民人均可支配收入')
# 绘制农村居民人均可支配收入曲线
plt.plot(years, rural_incomes, marker='s', linestyle='-', color='r', label='农村居民人均可支配收入')

# 标注城镇居民收入增长率
for i in range(len(years)):
    plt.text(years[i], urban_incomes[i], f'{urban_growth_rates[i]:.2%}',
             ha='center', va='bottom', fontproperties=font, color='b')

# 标注农村居民收入增长率
for i in range(len(years)):
    plt.text(years[i], rural_incomes[i], f'{rural_growth_rates[i]:.2%}',
             ha='center', va='top', fontproperties=font, color='r')

# 设置图表标题
plt.title('近 10 年中国城乡居民人均可支配收入变化趋势', fontproperties=font)
# 设置 x 轴标签
plt.xlabel('年份', fontproperties=font)
# 设置 y 轴标签
plt.ylabel('人均可支配收入（元）', fontproperties=font)
# 显示图例
plt.legend(prop=font)

# 设置 x 轴刻度为每年
plt.xticks(years)

# 确定 y 轴的最小值和最大值
min_y = min(min(urban_incomes), min(rural_incomes))
max_y = max(max(urban_incomes), max(rural_incomes))

# 设置更细的 y 轴刻度间隔，这里设置为 2000
step = 2000
y_ticks = list(range(int(min_y // step) * step, int((max_y // step + 1) * step), step))

# 设置 y 轴刻度
plt.yticks(y_ticks)

# 显示网格线，同时显示 x 轴和 y 轴的网格线
plt.grid(axis='both', which='major', linestyle='--', color='gray')

# 显示图表
plt.show()
