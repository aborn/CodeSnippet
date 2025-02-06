import matplotlib.pyplot as plt

# 年份数据
years = [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024]
# 城镇居民人均可支配收入数据
urban_incomes = [31195, 33616, 36396, 39251, 42359, 43834, 47412, 49283, 51821, 54844]
# 农村居民人均可支配收入数据
rural_incomes = [11422, 12363, 13432, 14617, 16021, 17131, 18931, 20133, 21691, 23119]

# 设置中文字体，这里以冬青黑体为例，根据实际情况修改字体路径
from matplotlib import font_manager
font_path = '/System/Library/Fonts/Hiragino Sans GB.ttc'
font = font_manager.FontProperties(fname=font_path)

# 解决负号显示问题
plt.rcParams['axes.unicode_minus'] = False

# 绘制城镇居民人均可支配收入曲线
plt.plot(years, urban_incomes, marker='o', linestyle='-', color='b', label='城镇居民人均可支配收入')
# 绘制农村居民人均可支配收入曲线
plt.plot(years, rural_incomes, marker='s', linestyle='-', color='r', label='农村居民人均可支配收入')

# 设置图表标题
plt.title('近 10 年中国城乡居民人均可支配收入变化趋势', fontproperties=font)
# 设置 x 轴标签
plt.xlabel('年份', fontproperties=font)
# 设置 y 轴标签
plt.ylabel('人均可支配收入（元）', fontproperties=font)
# 显示图例
plt.legend(prop=font)

# 显示网格线
plt.grid(True)

# 显示图表
plt.show()
